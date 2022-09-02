module binary_to_gray(gray,binary);
parameter SIZE = 4;
input [SIZE-1:0] binary;
output [SIZE-1:0] gray;

genvar i;
    assign gray[SIZE-1] = binary[SIZE-1] ;
generate
    for (i =1; i<SIZE; i=i+1)
        assign gray[SIZE-i-1]  = binary[SIZE-i-1] + binary[SIZE-i];
endgenerate

endmodule