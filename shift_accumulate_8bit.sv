module shift_accumulate_8bit(input logic [7:0] data_in,
                             input logic [2:0] shamt,
                             input logic shift_sel,
                             input logic subtract,
                             input logic CLK,
                             input logic reset,
                             output logic [7:0] data_out,
                             output logic c_out);
    logic [7:0] data_in_int;
    logic [7:0] data_in_shifted;
    assign data_in_int = (subtract)?~data_in_shifted:data_in_shifted;
    
    always_comb begin
        case(shift_sel)
            1'b0: data_in_shifted = data_in << shamt;
            1'b1: data_in_shifted = data_in >>> shamt;
        endcase
    end

    always_ff@(posedge CLK) begin
        if(reset) {c_out, data_out} <= 9'b0;
        else {c_out, data_out} <= data_out + data_in_int + subtract;
    end

endmodule
                             