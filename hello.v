module hello;
reg clk;
initial begin
clk = 1'b0;
$monitor("@ %2d Hello World ", clk, $time);
#100 $finish;
end
always begin
#10 clk = ~clk;
end
// dump the state of the design
// VCD (Value Change Dump) is a standard dump format defined in Verilog.
initial begin
$dumpfile("hello.vcd");
$dumpvars(0, hello);
end
endmodule

