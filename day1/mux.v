module mux_2x1(out,a,b,sel);
  input a,b,sel;
  output reg out;
  
  always @(a or b or sel)
    begin
      if(sel==1'b1)
        out = a;
      else
        out = b;
    end
  
endmodule