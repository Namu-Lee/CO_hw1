// data_memory.v

module data_memory #(
  parameter DATA_WIDTH = 32, MEM_ADDR_SIZE = 8
)(
  input  clk,
  input  mem_write,
  input  mem_read,
  input  [1:0] maskmode,
  input  sext,
  input  [DATA_WIDTH-1:0] address,
  input  [DATA_WIDTH-1:0] write_data,

  output reg [DATA_WIDTH-1:0] read_data
);

  // memory
  reg [DATA_WIDTH-1:0] mem_array [0:2**MEM_ADDR_SIZE-1]; // change memory size
  initial $readmemh("data/data_memory.mem", mem_array);
  // wire reg for writedata
  wire [MEM_ADDR_SIZE-1:0] address_internal; // 256 = 8-bit address

  assign address_internal = address[MEM_ADDR_SIZE+1:2]; // 256 = 8-bit address

  // update at negative edge
  always @(negedge clk) begin 
    if (mem_write == 1'b1) begin
      ////////////////////////////////////////////////////////////////////////
      // TODO : Perform writes (select certain bits from write_data
      // according to maskmode
      ////////////////////////////////////////////////////////////////////////
    end
  end

  // combinational logic
  always @(*) begin
    if (mem_read == 1'b1) begin
      ////////////////////////////////////////////////////////////////////////
      // TODO : Perform reads (select bits according to sext & maskmode)
      ////////////////////////////////////////////////////////////////////////
    end else begin
      read_data = 32'h0000_0000;
    end
  end

endmodule
