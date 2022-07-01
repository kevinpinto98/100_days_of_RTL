module d_ff(q,q_async,q_sync,d,clk,reset);
    input d,clk,reset;
    output reg q, q_async, q_sync;

    always @(posedge clk)
    begin
        q <= d;
    end
    
    always @(posedge clk or negedge reset)
    begin
        if(!reset)
        q <= 1'b0;
        else
        q_async <= d;
    end

    always @(posedge clk)
    begin
        if(!reset)
        q <= 1'b0;
        else
        q_sync <= d;
    end

endmodule
