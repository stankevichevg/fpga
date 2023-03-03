BOARD=tangnano9k
FAMILY=GW1N-9C
DEVICE=GW1NR-LV9QN88PC6/I5

all: full_adder.fs

# Synthesis
full_adder.json: full_adder.v
	yosys -p "read_verilog full_adder.v; synth_gowin -top full_adder -json full_adder.json"

# Place and Route
full_adder_pnr.json: full_adder.json
	nextpnr-gowin --json full_adder.json --write full_adder_pnr.json --freq 27 --device ${DEVICE} --family ${FAMILY} --cst ${BOARD}.cst

# Generate Bitstream
full_adder.fs: full_adder_pnr.json
	gowin_pack -d ${FAMILY} -o full_adder.fs full_adder_pnr.json

# Program Board
load: full_adder.fs
	openFPGALoader -b ${BOARD} full_adder.fs -f

full_adder_test.o: full_adder.v full_adder_tb.v
	iverilog -o full_adder_test.o -s full_adder_test full_adder.v full_adder_tb.v

test: full_adder_test.o
	vvp full_adder_test.o

# Cleanup build artifacts
clean:
	rm full_adder.vcd full_adder.fs full_adder_test.o

.PHONY: load
.INTERMEDIATE: full_adder_pnr.json full_adder.json