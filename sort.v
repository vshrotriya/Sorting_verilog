`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:03 04/13/2021 
// Design Name: 
// Module Name:    sort 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sort #(
    parameter NUM_VALS = 9,
    parameter SIZE     = 8
)(  input  wire clk,
    input  wire [NUM_VALS*SIZE-1:0] in,
    output reg  [NUM_VALS*SIZE-1:0] out,
	 output reg   [8-1:0] median
	 
);
    reg [NUM_VALS*SIZE-1:0] sorted_bus;
    always @(posedge clk) begin
        out <= sorted_bus;
		  median <= sorted_bus[39:32];
    end

    integer i, j;
    reg [SIZE-1:0] temp;
    reg [SIZE-1:0] array [1:NUM_VALS];
    always @* begin
        for (i = 0; i < NUM_VALS; i = i + 1) begin
            array[i+1] = in[i*SIZE +: SIZE];
        end

        for (i = NUM_VALS; i > 0; i = i - 1) begin
            for (j = 1 ; j < i; j = j + 1) begin
                if (array[j] < array[j + 1]) begin
                    temp         = array[j];
                    array[j]     = array[j + 1];
                    array[j + 1] = temp;
                end 
            end
        end

       for (i = 0; i < NUM_VALS; i = i + 1) begin
            sorted_bus[i*SIZE +: SIZE] = array[i+1];
       end
    end
endmodule