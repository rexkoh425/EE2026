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
    input [1:0] slave_rx, 
    input master_rx,
    output [1:0] master_tx, 
    output slave_tx,
    output[7:0] JC , 
    output[15:0] led ,
    output[3:0] an,
    output[6:0] seg,
    output dp
);
    wire clk6p25m;
    wire frame_begin ,sending_pixels , sample_pixel;
    wire[12:0] pixel_index;
    wire[15:0] pixel_data;
    var_clock clock_6p25MHZ(clk , 32'd7 , clk6p25m);
    
    assign led[15:1] = 15'b0;
    //Debouncing area
    ///////////////////////////////////////////////////////////////////////////
    wire DebouncedBtnU , DebouncedBtnD , DebouncedBtnL , DebouncedBtnR , DebouncedBtnC;
    ButtonDebouncing DebounceU(.button(btnU) , .clk(clk) , .DebouncedSignal(DebouncedBtnU));
    ButtonDebouncing DebounceD(.button(btnD) , .clk(clk) , .DebouncedSignal(DebouncedBtnD));
    ButtonDebouncing DebounceL(.button(btnL) , .clk(clk) , .DebouncedSignal(DebouncedBtnL));
    ButtonDebouncing DebounceR(.button(btnR) , .clk(clk) , .DebouncedSignal(DebouncedBtnR));
    ButtonDebouncing DebounceC(.button(btnC) , .clk(clk) , .DebouncedSignal(DebouncedBtnC));
    ///////////////////////////////////////////////////////////////////////////
    
    //  pixel data initialised as 0 here
    //////////////////////////////////////////////////////////////////////////
    wire player1_isReviving;
    PixelControl pixelColourControl(
        .clk100mhz(clk), .clk6p25m(clk6p25m),
    .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR),
    .pixel_index(pixel_index), .pixel_data(pixel_data),
    .DebouncedBtnC(DebouncedBtnC), .led3(led[3]),
    .led(led[0]), .reset(SW[14]), .masterToggle(SW[15]), .testLed(led[1]),
    .master_tx(master_tx), .master_rx(master_rx), .slave_rx(slave_rx), .slave_tx(slave_tx),
    .player1_isReviving(player1_isReviving)
    );
    //////////////////////////////////////////////////////////////////////////
    
    reg reset = 1'b0;
    Oled_Display Oled_display(
        clk6p25m, 
        reset, 
        frame_begin, sending_pixels,sample_pixel, 
        pixel_index, pixel_data, 
        JC[0],JC[1] , JC[3], JC[4], JC[5], JC[6],JC[7]
    );
    
    SevenSegDisplay SevenSegControl(
        .clk6p25m(clk6p25m),
        .player1_isReviving(player1_isReviving),
        .an(an),
        .seg(seg),
        .dp(dp)
    );     
endmodule
