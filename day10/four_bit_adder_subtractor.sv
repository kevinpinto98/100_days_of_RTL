module one_bit_adder(sum,cout,a,b,cin);
output sum,cout;
input a,b,cin;

wire w1,w2;

//Sum
xor(w1,a,b);
xor(sum,w1,cin);

//Carry
and(w2,a,b);
and(w3,w1,cin);
or(cout,w2,w3);
endmodule

module four_bit_adder(Sum,Cout,A,B,Cin);
input [3:0] A,B;
input Cin;
output [3:0] Sum;
output Cout;

wire C1,C2,C3;

one_bit_adder add1(Sum[0],C1,A[0],B[0],Cin);
one_bit_adder add2(Sum[1],C2,A[1],B[1],C1);
one_bit_adder add3(Sum[2],C3,A[2],B[2],C2);
one_bit_adder add4(Sum[3],Cout,A[3],B[3],C3);
endmodule

module adder_subtractor(s,c_out,ain,bin,sel);
input [3:0] ain,bin;
input sel;
output [3:0] s;
output c_out;

wire [3:0] b_inv;
wire c1,c2,c3;

xor (b_inv[0],sel,bin[0]);
xor (b_inv[1],sel,bin[1]);
xor (b_inv[2],sel,bin[2]);
xor (b_inv[3],sel,bin[3]);

one_bit_adder adder1(s[0],c1,ain[0],b_inv[0],sel);
one_bit_adder adder2(s[1],c2,ain[1],b_inv[1],c1);
one_bit_adder adder3(s[2],c3,ain[2],b_inv[2],c2);
one_bit_adder adder4(s[3],c_out,ain[3],b_inv[3],c3);
endmodule