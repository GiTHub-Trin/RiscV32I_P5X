# RV32I 5-stage pipeline - build / test entry points
#   make test          everything (IF, unit, directed, random)
#   make if_test       Instruction Fetch stage testbench only
#   make unit_test     IF + ALU + regfile
#   make core_test     whole-core directed programs vs. golden model
#   make random_test   constrained-random programs vs. golden model (SEEDS=n)
#   make wave_if       open IF-stage waveform (needs gtkwave)
SEEDS ?= 25
export SEEDS

.PHONY: test if_test unit_test core_test random_test wave_if clean

test:
	./scripts/run_tests.sh all
if_test:
	./scripts/run_tests.sh if
unit_test:
	./scripts/run_tests.sh unit
core_test:
	./scripts/run_tests.sh core
random_test:
	./scripts/run_tests.sh random
wave_if: if_test
	gtkwave build/tb_if_stage.vcd &
clean:
	rm -rf build/*
