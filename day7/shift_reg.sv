module shift_register(q,d,clk,reset);
output reg [3:0] q;
input d,clk,reset;

always @(posedge clk)
begin
if (reset)
    q <= 4'b0000;
else begin
    q <= q << 1;
    q[0] <= d;
end
end
endmodule