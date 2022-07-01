`timescale 1ns/100ps

module tb_mux_2x1();
 logic a,b,sel,out;
  
  mux_2x1 dut(out,a,b,sel);
  
  initial
    begin
      for (int i=0;i<10;i++)
        begin
          a = $random;
          b = $random;
          sel = $random;
          #10;
        end
    end
  
  initial
    begin
      $monitor("sel=%b, a=%b, b=%b, out=%b",sel,a,b,out);
    end
endmodule