module accumulate_8bit(input logic [7:0] data_in,
                       input logic subtract,
                       input logic CLK,
                       input logic reset,
                       output logic [7:0] data_out,
                       output logic c_out);
    logic [7:0] data_in_int;
    assign data_in_int = (subtract)?~data_in:data_in;
    always_ff@(posedge CLK) begin
        if(reset) {c_out, data_out} <= 9'b0;
        else {c_out, data_out} <= data_out + data_in_int + subtract;
    end

endmodule