`timescale 1ns/1ps
`include "accumulate_8bit.sv"

module accumulate_8bit_tb;
    logic [7:0] data_in;
    logic subtract;
    logic CLK;
    logic reset;
    logic [7:0] data_out;
    logic c_out;

    logic [9:0] test_vector[0:7]; 
    int i;

    accumulate_8bit dut(data_in, subtract, CLK, reset, data_out, c_out);

    initial begin
        CLK = 1'b0;
        forever #10 CLK = ~CLK;
    end

    initial begin
        $readmemb("testvectors.mem", test_vector);
        $dumpfile("accumulate_8bit_tb.vcd");
        $dumpvars;

        data_in = 8'b0;
        subtract = 1'b0;
        reset = 1'b1;

        @(posedge CLK)
            #1;
            reset = 1'b0;
        
        for(i = 0; i < 6; i = i + 1) begin
            {reset, subtract, data_in} = test_vector[i];
            @(posedge CLK);
            #1;
        end

        $finish;
    end

    initial begin
    $monitor("time=%0t | reset=%b subtract=%b data_in=%b | data_out=%b c_out=%b",
             $time, reset, subtract, data_in, data_out, c_out);
    end

endmodule

    
