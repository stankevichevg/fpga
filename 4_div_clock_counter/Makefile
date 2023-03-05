BOARD=tangnano9k
FAMILY=GW1N-9C
DEVICE=GW1NR-LV9QN88PC6/I5

all: div_clock.fs

# Synthesis
div_clock.json: div_clock.v
	yosys -p "read_verilog div_clock.v; synth_gowin -top div_clock -json div_clock.json"

# Place and Route
div_clock_pnr.json: div_clock.json
	nextpnr-gowin --json div_clock.json --write div_clock_pnr.json --freq 27 --device ${DEVICE} --family ${FAMILY} --cst ${BOARD}.cst

# Generate Bitstream
div_clock.fs: div_clock_pnr.json
	gowin_pack -d ${FAMILY} -o div_clock.fs div_clock_pnr.json

# Program Board
load: div_clock.fs
	openFPGALoader -b ${BOARD} div_clock.fs -f

div_clock_test.o: div_clock.v div_clock_tb.v
	iverilog -o div_clock_test.o -s div_clock_test div_clock.v div_clock_tb.v

test: div_clock_test.o
	vvp div_clock_test.o

# Cleanup build artifacts
clean:
	rm div_clock.vcd div_clock.fs div_clock_test.o

.PHONY: load
.INTERMEDIATE: div_clock_pnr.json div_clock.json