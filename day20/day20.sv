// A 4-bit serial adder
module day20(S,C,clk,shift_control,serial_input,clear,reset);
inout S,C;
input clk,shift_control,clear,reset;
input serial_input;

wire clk_ff;

assign clk_ff = clk & shift_control;

logic x,y,z;

logic [3:0] reg1, reg2;

flip_flop ff(z,C,clk_ff,clear);
shift_register_augend shift_reg1(x,reg1,S,clk,reset,shift_control);
shift_register_addend shift_reg2(y,reg2,serial_input,clk,reset,shift_control);
full_adder fa(S,C,x,y,z);
endmodule

//Full Adder
module full_adder(S,C,x,y,z);
output S,C;
input x,y,z;

assign {C,S} = x + y + z;
endmodule

//Flip-flop
module flip_flop(q,d,clk,clear);
output reg q;
input d,clk,clear;

always @(posedge clk) begin
if(!clear) q <= 1'b0;
else q <= d;
end
endmodule

//Shift Register for Augend
module shift_register_augend(out,dout,din,clk,reset,shift_control);
output reg out;
output reg [3:0] dout;
input din;
input clk, reset;
input shift_control;


always @(posedge clk) begin
if(shift_control) begin
    if(!reset) begin
        dout <= 4'b0000;
        out <= 1'b0;
    end
    else begin
        dout <= {din,dout[3:1]};
        out <= dout[0];
    end
end
end
endmodule

//Shift Register for Addend
module shift_register_addend(out,dout,din,clk,reset,shift_control);
output reg out;
output reg [3:0] dout;
input din;
input clk, reset;
input shift_control;


always @(posedge clk) begin
if(shift_control) begin
    if(!reset) begin
        dout <= 4'b1001;
        out <= 1'b0;
    end
    else begin
        dout <= {din,dout[3:1]};
        out <= dout[0];
    end
end
end
endmodule