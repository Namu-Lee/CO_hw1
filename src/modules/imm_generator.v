// imm_generator.v

module imm_generator #(
  parameter DATA_WIDTH = 32
)(
  input [31:0] instruction,

  output reg [DATA_WIDTH-1:0] sextimm
);

wire [6:0] opcode;
assign opcode = instruction[6:0];

always @(*) begin
  case (opcode)
    //////////////////////////////////////////////////////////////////////////
    // TODO : Generate sextimm using instruction
    //////////////////////////////////////////////////////////////////////////
	// immediate Arithmetic (I-type)
	7'b001_0011: sextimm = {{20{instruction[31]}}, instruction[31:20]};
	// Load (I-type)
	7'b000_0011: sextimm = {{20{instruction[31]}}, instruction[31:20]};
	//Store (S-type)
    7'b010_0011: sextimm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
	//Branch (B-type)
	7'b110_0011: sextimm = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
	// Jump and Link (J-type)
	7'b110_1111: sextimm = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
	// Jump and Link Reg (I-type)
	7'b110_0111: sextimm = {{20{instruction[31]}}, instruction[31:20]};
	
	// TODO END
	
	default:     sextimm = 32'h0000_0000;
  endcase
end


endmodule
