module shift_8bit(input logic [7:0] data_in,
                  input logic [2:0] shamt,
                  input logic shift_sel,
                  output logic [7:0] data_out);
    case(shift_sel)
        1'b0: data_out = data_in << shamt;
        1'b1: data_out = data_in >>> shamt;        
    endcase
endmodule