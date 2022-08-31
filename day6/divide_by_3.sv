module divide_by_3(clk_out,clk,reset);
output clk_out;
input clk, reset;

reg [1:0] pos_count, neg_count;

always @(posedge clk)
begin
if (reset) pos_count <= 0;
else if (pos_count == 2'b10) pos_count <= 0;
else pos_count <= pos_count+1'b1;
end

always @(negedge clk)
begin
if (reset) neg_count <= 0;
else if (neg_count == 2'b10) neg_count <= 0;
else neg_count <= neg_count+1'b1;
end

assign clk_out = ((pos_count==2'b10) | (neg_count==2'b10));

endmodule