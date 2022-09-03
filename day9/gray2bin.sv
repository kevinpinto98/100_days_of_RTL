module gray_to_binary(binary,gray);
parameter SIZE = 4;
output [SIZE-1:0] binary;
input [SIZE-1:0] gray;

genvar i;
    assign binary[SIZE-1] = gray[SIZE-1] ;
generate
    for (i =1; i<SIZE; i=i+1)
        assign binary[SIZE-i-1]  = gray[SIZE-i-1] + binary[SIZE-i];
endgenerate

endmodule