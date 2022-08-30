`timescale 1ns/100ps

module tb_dut();
 reg req_0,req_1,clk,reset;
 wire gnt_0,gnt_1;
  
  my_dut my_dut1(.clk(clk),
                  .req_0(req_0),
                  .req_1(req_1),
                  .reset(reset),
                  .gnt_0(gnt_0),
                  .gnt_1(gnt_1)
                );
  
  initial
  begin
    clk = 1'b0;
  end

  always #5 clk = ~clk;

  initial
  begin
    reset = 1'b1;
    #15 reset = 1'b0;
    #5 req_0 = 1'b1;
    #10 req_0 = 1'b0;
    #10 req_1 = 1'b1;
    #5 req_1 = 1'b0;
  end

  initial begin #200 $finish; end

  initial begin
    $dumpfile("dut.vcd");
    $dumpvars(0,tb_dut);
  end
endmodule