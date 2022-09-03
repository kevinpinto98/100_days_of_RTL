module tb_binary_to_gray();
parameter SIZE=4;
reg [SIZE-1:0] binary;
wire [SIZE-1:0] gray;

binary_to_gray dut(gray,binary);

integer i;

initial
begin
binary = 4'b0000;
#10;
for (i = 0; i < 15; i = i + 1)
begin
#10 binary  = binary + 1'b1;
end
end

initial
begin
$monitor("Time = %0d: Binary = %b, Gray = %b",$time,binary,gray);
end

endmodule