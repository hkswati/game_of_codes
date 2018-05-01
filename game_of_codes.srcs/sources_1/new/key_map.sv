`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2017 04:03:36 PM
// Design Name: 
// Module Name: key_map
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

module key_map( input logic [3:0] key_value,
                output logic [3:0] mapped_val
             );
        always_comb
            case(key_value)
               4'b0000: mapped_val = 4'b1010; //D
               4'b0001: mapped_val = 4'b0011; //# 
               4'b0010: mapped_val = 4'b1110; //0 
               4'b0011: mapped_val = 4'b1100; //. 
               4'b0100: mapped_val = 4'b0101; //C 
               4'b0101: mapped_val = 4'b0000; //9 
               4'b0110: mapped_val = 4'b0110; //8 
               4'b0111: mapped_val = 4'b0001; //7 
               4'b1000: mapped_val = 4'b0100; //B 
               4'b1001: mapped_val = 4'b1101; //6 
               4'b1010: mapped_val = 4'b1011; //5
               4'b1011: mapped_val = 4'b1000; //4 
               4'b1100: mapped_val = 4'b1001; //A 
               4'b1101: mapped_val = 4'b1111; //3
               4'b1110: mapped_val = 4'b0111; //2
               4'b1111: mapped_val = 4'b0010; //1         
             endcase                                     
endmodule                                                   

