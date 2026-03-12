module add_subtract_8bit(input logic [7:0] A,
                        input logic [7:0] B,
                        input logic subtract,
                        output logic [7:0] S
                        output logic c_out);
    logic B_int;
    assign B_int = (subtract)?~B:B;
    always_comb begin
       assign {c_out, S} = A + B_int + subtract;
    end 
endmodule

