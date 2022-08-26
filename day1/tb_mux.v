`timescale 1ns/100ps

module tb_mux_2x1();
 reg a,b,sel;
 wire out;
  
  mux_2x1 dut(out,a,b,sel);
  
  initial
    begin
      sel = 1'b0; a = 1'b0; b = 1'b0;
      #10 sel = 1'b0; a = 1'b0; b = 1'b1;
      #10 sel = 1'b0; a = 1'b1; b = 1'b0;
      #10 sel = 1'b0; a = 1'b1; b = 1'b1;
      #10 sel = 1'b1; a = 1'b0; b = 1'b0;
      #10 sel = 1'b1; a = 1'b0; b = 1'b1;
      #10 sel = 1'b1; a = 1'b1; b = 1'b0;
      #10 sel = 1'b1; a = 1'b1; b = 1'b1;
    end
  
  initial
    begin
      $monitor("sel=%b, a=%b, b=%b, out=%b",sel,a,b,out);
    end
endmodule