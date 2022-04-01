all: simple_cpu

MODULES = src/modules/ALU.v \
					src/modules/ALU_control.v \
					src/modules/defines.v \
					src/modules/register_file.v \
					src/modules/control.v \
					src/modules/data_memory.v \
					src/modules/mux_2x1.v	\
					src/modules/mux_4x1.v	\
					src/modules/imm_generator.v \
					src/modules/adder.v \
					src/modules/branch_control.v

SOURCES = ./src/riscv_tb.v ./src/simple_cpu.v 

simple_cpu: $(MODULES) $(SOURCES)
	iverilog -I src/modules/ -s riscv_tb -o $@ $^

clean:
	rm -f simple_cpu *.vcd
# rm -r xsim.dir xvlog.*
