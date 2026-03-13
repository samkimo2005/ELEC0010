`timescale 1ns/1ps
`include "adder_8bit.sv"

module adder_8bit_tb;
    logic [7:0] A;
    logic [7:0] B;
    logic c_in;
    logic [7:0] S;
    logic c_out;
    adder_8bit dut(A, B, c_in, S, c_out);

    initial begin
        $dumpfile("adder_8bit_tb.vcd");
        $dumpvars;
        // Test 1
        A = 8'h00; B = 8'h00; c_in = 1'b0; #10;

        // Test 2
        A = 8'h01; B = 8'h01; c_in = 1'b0; #10;

        // Test 3
        A = 8'h05; B = 8'h03; c_in = 1'b0; #10;

        // Test 4
        A = 8'h05; B = 8'h03; c_in = 1'b1; #10;

        // Test 5
        A = 8'hFF; B = 8'h01; c_in = 1'b0; #10;

        // Test 6
        A = 8'h5F; B = 8'h00; c_in = 1'b1; #10;

        $finish;
    end

    initial begin
        $monitor("time %0t | A = %h, B = %h, c_in = %h || S = %h, c_out = %h", $time, A, B, c_in, S, c_out);
    end

endmodule
