`timescale 1ns/1ps
`include "add_subtract_8bit.sv"

module add_subtract_8bit_tb;
    logic [7:0] A;
    logic [7:0] B;
    logic subtract;
    logic [7:0] S;
    logic c_out;
    add_subtract_8bit dut(A, B, subtract, S, c_out);

    initial begin
        $dumpfile("add_subtract_8bit_tb.vcd");
        $dumpvars;
        A = 8'h05; B = 8'h03; subtract = 1'b0; #10;
        A = 8'h0F; B = 8'h01; subtract = 1'b0; #10;
        A = 8'hFF; B = 8'h01; subtract = 1'b0; #10;

        A = 8'h09; B = 8'h04; subtract = 1'b1; #10;
        A = 8'h10; B = 8'h01; subtract = 1'b1; #10;
        A = 8'h03; B = 8'h05; subtract = 1'b1; #10; 

        $finish;
    end

    initial begin
        $monitor("time = %0t | A = %h, B = %h, subtract = %b || S = %h, c_out = %b", $time, A, B, subtract, S, c_out);
    end

endmodule



