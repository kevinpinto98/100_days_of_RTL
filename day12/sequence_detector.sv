module sequence_detector(out,in,clk,reset);
output out;
input in,clk,reset;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

reg [2:0] state, next_state;

always @(posedge clk)
begin
if (reset) state <= S0;
else state <= next_state;
end

assign out = (state == S4) ? 1:0;

always @(state or in)
begin
case (state)
S0: begin
if(in) next_state = S1;
else next_state = S0;
end

S1: begin
if(in) next_state = S1;
else next_state = S2;
end

S2: begin
if(in) next_state = S3;
else next_state = S0;
end

S3: begin
if(in) next_state = S4;
else next_state = S2;
end

S4: begin
if(in) next_state = S0;
else next_state = S2;
end
endcase
end

endmodule