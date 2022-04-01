module adder #(
  parameter DATA_WIDTH = 32
)(
  input [DATA_WIDTH-1:0] in_a,
  input [DATA_WIDTH-1:0] in_b,

  output reg [DATA_WIDTH-1:0] result
);

// combinational logic
always @(*) begin
  result = in_a + in_b;
end

endmodule
