`timescale 1ns/100ps

module tb_dff();
    reg clk,reset,d;
    wire q,q_sync,q_async;

    d_ff dut(q,q_async,q_sync,d,clk,reset);

    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;

    //d_ff dut(q,q_async,q_sync,d,clk,reset);
    //intial begin #200 $finish; end



    initial 
    begin
        $dumpfile("tb_dff.vcd");
        $dumpvars(0,tb_dff);
    end
endmodule
