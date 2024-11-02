`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:19:30
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    output [7:0] JC
    );
    wire clk6p25m;
    wire frame_begin ,sending_pixels , sample_pixel;
    wire[12:0] pixel_index;
    wire[15:0] pixel_data;
    reg reset = 1'b0;
    var_clock clock_6p25MHZ(.clk(clk) , .M(7) , .SLOW_CLOCK(clk6p25m));
    
   
    
//    p2_win testing(.clk6p25m(clk6p25m), .pixel_index(pixel_index), .pixel_data(pixel_data));
    
//    pixelDataControl(
//        .pixel_index(pixel_index),
//        .clk(clk),
//        .pixel_data(pixel_data)
//        );
    renderStartText(.clk6p25m(clk6p25m), .pixel_index(pixel_index), .pixel_data(pixel_data));
    
    Oled_Display Oled_display(
        clk6p25m, 
        reset, 
        frame_begin, sending_pixels,sample_pixel, 
        pixel_index, pixel_data, 
        JC[0], JC[1] , JC[3], JC[4], JC[5], JC[6],JC[7]
    );
endmodule
