`timescale 1ns/100ps

module tb_gray_to_binary();
parameter SIZE=4;
wire [SIZE-1:0] binary;
reg [SIZE-1:0] gray;

gray_to_binary dut(binary,gray);

integer i;

initial
begin
gray = 4'b0000;
#10;
for (i = 0; i < 15; i = i + 1)
begin
#10 gray = gray + 1'b1;
end
end

initial
begin
$monitor("Time = %0d: Gray = %b, Binary = %b",$time,gray,binary);
end

endmodule