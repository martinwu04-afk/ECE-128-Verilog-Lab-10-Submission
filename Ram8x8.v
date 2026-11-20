`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2026 05:42:02 AM
// Design Name: 
// Module Name: Ram8x8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Ram8x8 (input wire clk, input wire we, input wire [2:0] addr, input wire [7:0] din, output reg [7:0] dout);
    reg [7:0] mem [0:7]; 
    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;  
        else
            dout <= mem[addr]; 
    end
endmodule
