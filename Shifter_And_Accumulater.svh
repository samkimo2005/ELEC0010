module shift_accumulate_8bit(input logic [7:0] data_in
                             input logic [2:0] shamt
                             input logic shift_sel
                             input logic subtract
                             input logic CLK
                             input logic reset
                             output logic [7:0] data_out
                             output logic c_out);
    logic data_in_int;
    assign data_in_int = (subtract)?~data_in:data_in;
    case(shift_sel)
        1'b0: data_in = data_in << shamt;
        1'b1: data_in = data_in >>> shamt;
    endcase

    always_ff@(posedge CLK)
        if(reset)data_out <= 8'b0;
        else data_out = data_out + data_in_int;

endmodule
                             