`timescale 1ns/1ps
`include "shift_accumulate_8bit.sv"

module shift_accumulate_8bit_tb;
    logic [7:0] data_in;
    logic [2:0] shamt;
    logic shift_sel;
    logic subtract;
    logic CLK;
    logic reset;
    logic [7:0] data_out;
    logic c_out;
    logic [13:0] test_vector [0:5];
    int i;
    shift_accumulate_8bit dut(data_in, shamt, shift_sel, subtract, CLK, reset, data_out, c_out);

    initial begin
        CLK = 1'b0;
        forever #10 CLK = ~CLK;
    end

    initial begin
        $readmemb("testvectors2.mem", test_vector);
        $dumpfile("shift_accumulate_8bit_tb.vcd");
        $dumpvars;
        data_in = 8'b0;
        subtract = 1'b0;
        reset = 1'b1;

        @(posedge CLK)
            #1;
            reset = 1'b0;
        
        for(i = 0; i < 6; i = i + 1) begin
            {reset, subtract, shift_sel, shamt, data_in} = test_vector[i];
            @(posedge CLK);
            #1;
        end

        $finish;
    end

    initial begin
        $monitor("time = %0t | data_in = %h, shamt = %h, shift_sel = %h, subtract = %h, CLK = %h, reset = %h || data_out = %h, c_out = %h", $time, data_in, shamt, shift_sel, subtract, CLK, reset, data_out, c_out);
    end

endmodule

