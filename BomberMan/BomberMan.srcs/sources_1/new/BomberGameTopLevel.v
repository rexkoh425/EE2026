`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 11:56:48
// Design Name: 
// Module Name: BomberGameTopLevel
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


module BomberGameTopLevel(
    input clk , 
    input[15:0] SW ,
    input btnU , btnD , btnL , btnR , btnC ,
    output[7:0] JC , 
    output[15:0] led
);
    wire clk6p25m;
    wire frame_begin ,sending_pixels , sample_pixel;
    wire[12:0] pixel_index;
    wire[15:0] pixel_data;
    var_clock clock_6p25MHZ(clk , 32'd7 , clk6p25m);
    
    //  pixel data initialised as 0 here
    //////////////////////////////////////////////////////////////////////////
    PixelControl pixelColourControl(
        .clk100mhz(clk), .clk6p25m(clk6p25m),
        .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
        .pixel_index(pixel_index), .pixel_data(pixel_data) ,
        .led(led[0])
    );
    //////////////////////////////////////////////////////////////////////////
    
    reg reset = 1'b0;
    Oled_Display Oled_display(clk6p25m, reset, frame_begin, sending_pixels,
    sample_pixel, pixel_index, pixel_data, JC[0],JC[1] , JC[3], JC[4], JC[5], JC[6],
    JC[7]);
endmodule
