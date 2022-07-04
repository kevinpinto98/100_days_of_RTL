module counter4bit(count,reset,clk);
    output reg [3:0] count;
    input reset,clk;

    initial begin
        count<=4'b0000;
    end

    always @(posedge clk) begin
    if(!reset)
        count<=4'b0000;
    else
        count<= count + 1'b1;
    end
endmodule
