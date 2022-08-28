module edge_detector(rising_edge,falling_edge,d,clk);
    input d,clk;
    output rsing_edge,falling_edge;
    
    logic d_ff_out;

    always @(posedge clk)
    begin
        d_ff_out <= d;
    end

    //Rising edge detector
    assign rising_edge = d & ~d_ff_out;

    //Falling edge detector
    assign falling_edge = ~d & d_ff_out;

endmodule