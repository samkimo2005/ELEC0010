`timescale 1ns/1ps
`include "shift_8bit.sv"

module shift_8bit_tb;
    logic [7:0] data_in;
    logic [2:0] shamt;
    logic shift_sel;
    logic [7:0] data_out;
    shift_8bit dut(data_in, shamt, shift_sel, data_out);

    initial begin
        $dumpfile("shift_8bit_tb.vcd");
        $dumpvars;
        data_in   = 8'b10110011; shamt = 3'b000; shift_sel = 1'b0; #10;
        data_in   = 8'b10110011; shamt = 3'b001; shift_sel = 1'b0; #10;
        data_in   = 8'b10110011; shamt = 3'b011; shift_sel = 1'b0; #10;
        data_in   = 8'b10110011; shamt = 3'b001; shift_sel = 1'b1; #10;
        data_in   = 8'b10110011; shamt = 3'b010; shift_sel = 1'b1; #10;
        data_in   = 8'b10110011; shamt = 3'b111; shift_sel = 1'b1; #10;
        $finish;
    end

    initial begin
        $monitor("time = %0t | data_in = %b, shamt = %b, shift_sel = %b || data_out = %b", $time, data_in, shamt, shift_sel, data_out);
    end

endmodule


    