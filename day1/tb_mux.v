`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 02:49:48 PM
// Design Name: 
// Module Name: tb_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_test();

reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

full_adder fa(sum,cout,a,b,cin);

initial
begin
$display();
end

initial
begin
$monitor();
end

endmodule
