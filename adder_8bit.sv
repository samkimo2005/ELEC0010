module adder_8bit(input logic [7:0] A,
           input logic [7:0] B,
           input logic c_in,
           output logic [7:0] S,
           output logic c_out);
    always_comb 
    begin
      {c_out, S} = A + B + c_in;
    end
endmodule
