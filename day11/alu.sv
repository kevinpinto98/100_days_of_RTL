module mux_3x1(out,sel,in1,in2,in3);
output reg out;
input in1,in2,in3;
input [1:0] sel;

always @(sel or in1 or in2 or in3)
begin
case (sel)
2'b00: out  = in1;
2'b01: out = in2;
2'b10: out = in3;
endcase
end

endmodule

module bit32_3x1_mux(out,sel,in1,in2,in3);
output [31:0] out;
input [31:0] in1,in2,in3;
input [1:0] sel;

genvar j;

generate
    for (j=0; j < 32; j = j + 1) begin
        mux_3x1 mux(out[j],sel,in1[j],in2[j],in3[j]);
    end
endgenerate

endmodule

module bit32AND(out,in1,in2);
input [31:0] in1,in2;
output [31:0] out;
assign {out}=in1 & in2;
endmodule


module bit32OR(out,in1,in2);
input [31:0] in1,in2;
output [31:0] out;
assign {out}=in1 | in2;
endmodule

module FA_dataflow(Cout, Sum,In1,In2,Cin);
input [31:0] In1,In2;
input Cin;
output Cout;
output [31:0] Sum;
assign {Cout,Sum}=In1+In2+Cin;
endmodule

module alu(Result,CarryOut,a,b,Operation,CarryIn,Binvert);
output [31:0] Result;
output CarryOut;
input [31:0] a,b;
input [1:0] Operation;
input CarryIn,Binvert;

wire [31:0] b_inv, b_out;

assign b_inv = ~b;

assign b_out = (Binvert == 1'b0) ? b : b_inv;

wire [31:0] and_output, or_output, sum_output;

bit32AND dut_and(and_output,a,b);
bit32OR dut_or(or_output,a,b);
FA_dataflow adder(CarryOut,sum_output,a,b_out,CarryIn);
bit32_3x1_mux dut_mux(Result,Operation,and_output,or_output,sum_output);

endmodule