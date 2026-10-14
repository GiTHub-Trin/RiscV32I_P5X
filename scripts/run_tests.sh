#!/usr/bin/env bash
# ----------------------------------------------------------------------------
# run_tests.sh  [unit|if|core|random|all]   (default: all)
#   Requires: iverilog + vvp (Icarus Verilog >= 10), python3
#   Env:      SEEDS=<n> number of random programs (default 25)
#             NINSTR=<n> instructions per random program (default 150)
# ----------------------------------------------------------------------------
set -u
cd "$(dirname "$0")/.."

MODE=${1:-all}
SEEDS=${SEEDS:-25}
NINSTR=${NINSTR:-150}
IV="iverilog -g2005 -Wall -I rtl/include"
RTL=$(find rtl -name '*.v' | sort)
fail=0

mkdir -p build/random

run_unit() {                       # run_unit <tb_name>
    local tb=$1
    if ! $IV -s "$tb" -o "build/$tb.vvp" "tb/$tb.v" $RTL; then
        echo "COMPILE ERROR: $tb"; fail=1; return
    fi
    vvp -n "build/$tb.vvp" > "build/$tb.log" 2>&1
    grep -E "PASS|FAIL|TIMEOUT|ERROR" "build/$tb.log"
    grep -q "PASS" "build/$tb.log" || { fail=1; cat "build/$tb.log"; }
}

build_core_tb() {
    $IV -s tb_riscv_core -o build/tb_riscv_core.vvp tb/tb_riscv_core.v $RTL || {
        echo "COMPILE ERROR: tb_riscv_core"; fail=1; return 1; }
}

run_prog() {                       # run_prog <asm file> <basename in build/>
    local src=$1 name=$2
    python3 tools/rvasm.py "$src" -o "build/$name.hex" > /dev/null || { fail=1; return; }
    python3 tools/rvsim.py "build/$name.hex" -o "build/$name.exp" > /dev/null || { fail=1; return; }
    vvp -n build/tb_riscv_core.vvp +HEX="build/$name.hex" +EXP="build/$name.exp" +CYCLES=4000 \
        > "build/$name.log" 2>&1
    if grep -q "PASS" "build/$name.log"; then
        echo "  PASS  $name"
    else
        echo "  FAIL  $name"; cat "build/$name.log" | head -40; fail=1
    fi
}

case "$MODE" in all|unit|if)
    echo "== IF stage =="
    run_unit tb_if_stage ;;
esac
case "$MODE" in all|unit)
    echo "== unit tests =="
    run_unit tb_alu
    run_unit tb_regfile ;;
esac
case "$MODE" in all|core)
    echo "== directed programs =="
    build_core_tb && for f in sw/directed/*.s; do run_prog "$f" "$(basename "$f" .s)"; done ;;
esac
case "$MODE" in all|random)
    echo "== random programs ($SEEDS x $NINSTR instr) =="
    build_core_tb && for s in $(seq 1 "$SEEDS"); do
        python3 tools/gen_random.py "$s" "$NINSTR" > "build/random/rand_$s.s"
        run_prog "build/random/rand_$s.s" "random/rand_$s"
    done ;;
esac

if [ $fail -eq 0 ]; then echo "ALL TESTS PASSED"; else echo "SOME TESTS FAILED"; fi
exit $fail
