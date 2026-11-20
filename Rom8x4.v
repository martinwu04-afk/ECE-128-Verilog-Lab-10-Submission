`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2026 05:42:02 AM
// Design Name: 
// Module Name: Rom8x4
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

module Rom8x4 (input wire [2:0] addr, input wire en, output wire [3:0] dout);
    reg [3:0] mem [0:7];
    initial $readmemb("rom_data.mem", mem); 
    assign dout = en ? mem[addr] : 4'bz;  
endmodule
 
