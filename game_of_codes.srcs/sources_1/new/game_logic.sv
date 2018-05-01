`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2017 03:59:55 PM
// Design Name: 
// Module Name: game_logic
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

module game_logic(input logic clk,
                  input logic reset,
                  //step motor        
                  output [3:0] phases,
                      
//                  input [1:0] direction,
//                  input [1:0] rotation_duration,
                  input start,
                  
                  //keypad
                  output [3:0]keyb_row,
                  input [3:0]keyb_col,
                  
                  //7-segment signals
                   output a, b, c, d, e, f, g, dp, 
                   output [3:0] an,
                   output logic [3:0] leds

    );
    logic [3:0] data;
    logic [3:0] code;
    code_gen random_code(clk, reset, data);
    flopenr register (clk, reset, key_valid, data, code);
     
    logic [3:0] key_value;
    keypad4X4 keypad4X4_inst0(
        .clk(clk),
        .keyb_row(keyb_row), // just connect them to FPGA pins, row scanner
        .keyb_col(keyb_col), // just connect them to FPGA pins, column scanner
        .key_value(key_value), //user's output code for detected pressed key: row[1:0]_col[1:0]
        .key_valid(key_valid)  // user's output valid: if the key is pressed long enough (more than 20~40 ms), key_valid becomes '1' for just one clock cycle.
    );    
    
    //4 numbers to keep value of any of 4 digits
    //user's hex inputs for 4 digits
    logic [3:0] in0 = 4'h0; //initial value
    logic [3:0] in1 = 4'h0; //initial value
    logic [3:0] in2 = 4'h0; //initial value
    logic [3:0] in3 = 4'h0; //initial value
    
    // this module shows 4 decimal numbers on 4-digit 7-Segment.  
    // 4 digits are scanned with high speed, then you do not notice that every time 
    // only one of them is ON. dp is always off.
    SevSeg_4digit SevSeg_4digit_inst0(
        .clk(clk),
        .in3(in3), .in2(in2), .in1(in1), .in0(in0), //user inputs for each digit (hexadecimal)
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp), // just connect them to FPGA pins (individual LEDs).
        .an(an)   // just connect them to FPGA pins (enable vector for 4 digits active low) 
    );
    
      
                      
    steppermotor_wrapper steppermotor_wrapper_inst0(
        
        .clk(clk), //100Mhz on Basys3
        
        //user input for motor rotation direction. 
        // direction[0]: first movement 
        // direction[1]: second movement
        // 1'b0: left  1'b1: right    
        .direction(code[3:2]), 
        
        //user input for motor rotation duration.
        // rotation_duration[0]: first movement 
        // rotation_duration[1]: second movement
        // 1'b0: short  1'b1: long
        .rotation_duration(code[1:0]), 
        
        // just connect them to FPGA (motor driver)    
        .phases(phases), 
        
        //user input to initiate motor. a pulse (at least one clock cycle) start motor movements. 
        // if you re-apply it before the motor finishes both movements, it is ignored.
        .start(start) 
    );
    logic [3:0] map_val;
    key_map(key_value, map_val);
    always@ (posedge clk)
        begin    
            if (key_valid == 1'b1) 
               begin
                 if       (map_val== code)  
                   begin
                     if (in0 == 4'h9)   in0 <= 4'h9;
                     else  in0 <= in0 + 4'd1;
                   end     
                 else 
                    begin
                      if  (in0 == 4'h0)  in0 <= 4'h0;
                      else  in0 <= in0 - 4'd1;
                    end  
               end 
             if (start) 
                 begin 
                   in1 <= code;
                   leds <= code;
                 end 
              if (reset)
                 begin
                    in0 <= 4'h0;
                    in1 <= 4'h0;
                    leds <= 4'b0;
                 end     
    end
endmodule
