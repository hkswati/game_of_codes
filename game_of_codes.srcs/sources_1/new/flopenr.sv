`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2017 04:02:44 PM
// Design Name: 
// Module Name: flopenr
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

module flopenr( input logic clk,
                input logic reset,
                input logic en,
                input logic [3:0] d,
                output logic [3:0] q);
  //asynchronous reset
  always_ff @(posedge clk, posedge reset)
     if (reset) q <=   4'b0;
     else if (en) q <= d;
endmodule
