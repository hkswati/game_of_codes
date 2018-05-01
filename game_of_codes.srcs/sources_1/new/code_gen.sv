`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2017 04:01:44 PM
// Design Name: 
// Module Name: code_gen
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



module code_gen(input  logic clk_in,
                input  logic reset,
                output logic [3:0] data);
                
        logic [15:0] state;
        assign data = state [3:0];
        
        always_ff @(posedge clk_in, posedge reset)
             if (reset) state <= 16'hFFFF;
             else 
               begin
                 state[15:1] <= state[14:0];
                 state[0] <= (state[15] ^ state[1] ^ state[2] ^ state [4] );
               end
endmodule

