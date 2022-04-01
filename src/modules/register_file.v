// register_file.v
// this models 32, 32-bit registers

module register_file #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 5
)(
  input clk, 
  input  [ADDR_WIDTH-1:0] rs1, 
  input  [ADDR_WIDTH-1:0] rs2, 
  input  [ADDR_WIDTH-1:0] rd,
  input reg_write, 
  input  [DATA_WIDTH-1:0] write_data,

  output [DATA_WIDTH-1:0] rs1_out,
  output [DATA_WIDTH-1:0] rs2_out
);

  // memory array
  reg [DATA_WIDTH-1:0] reg_array[0:2**ADDR_WIDTH-1];
  initial $readmemh("data/register.mem", reg_array); // change initial register file for fib example

  // update regfile at the falling edge
  always @(negedge clk) begin 
    if (reg_write == 1'b1) reg_array[rd] <= write_data;
    reg_array[0] <= 0; // x0 is always zero in RISC-V
  end

  assign rs1_out = reg_array[rs1];
  assign rs2_out = reg_array[rs2];

endmodule
