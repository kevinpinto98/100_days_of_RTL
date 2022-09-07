//A three input priority arbiter
module priority_arbiter(G,R);
output [2:0] G;
input [2:0] R;

wire not_R1, not_R2;

assign not_R1 = ~R[1];
assign not_R2 = ~R[2];

assign G[0] = R[0] & not_R1 & not_R2;
assign G[1] = R[1] & not_R2;
assign G[2] = R[2];

endmodule