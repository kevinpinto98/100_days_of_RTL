//A Simple Arbiter with two inputs and two outputs
module my_dut(gnt_0,gnt_1,req_0,req_1,clk,reset);
    output reg gnt_0, gnt_1;
    input req_0, req_1, clk, reset;

    parameter SIZE = 3;
    parameter IDLE = 3'b001, GNT0 = 3'b010, GNT1 = 3'b100;

    reg [SIZE-1:0] state;
    reg [SIZE-1:0] next_state;

    //Combinational Logic
    always @(state or req_0 or req_1)
    begin
        case(state)
        
            IDLE: 
                if(req_0==1'b1)
                    next_state <= GNT0;
                else if (req_1==1'b1)
                    next_state <= GNT1;
                else
                    next_state <= IDLE;
            GNT0:
                if(req_0==1'b1)
                    next_state <= GNT0;
                else
                    next_state <= IDLE;
            GNT1:
                if(req_1==1'b1)
                    next_state <= GNT1;
                else
                    next_state <= IDLE;
            default:
                next_state <= IDLE;  
        endcase

    end

    //Sequential Logic
    always @(posedge clk)
    begin
        if (reset == 1'b1)
            state <= IDLE;
        else
            state <= next_state;
    end

    //Output Logic
    always @(posedge clk)
    begin
        if (reset == 1'b1)
        begin
            gnt_0 <= 1'b0;
            gnt_1 <= 1'b0;
        end
        else 
        begin
            case(state)
                IDLE:
                begin
                    gnt_0 <= 1'b0;
                    gnt_1 <= 1'b0;
                end
                GNT0:
                begin
                    gnt_0 <= 1'b1;
                    gnt_1 <= 1'b0;
                end
                GNT1:
                begin
                    gnt_0 <= 1'b0;
                    gnt_1 <= 1'b1;
                end
                default:
                begin
                    gnt_0 <= 1'b0;
                    gnt_1 <= 1'b0;
                end
            endcase

        end
    end

endmodule
