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
    input[15:0] SW,
    input btnU , btnD , btnL , btnR , btnC ,
    input [3:0] slave_rx, 
    input [2:0] master_rx,
    output [3:0] master_tx, 
    output [2:0] slave_tx,
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
    wire start_game;
    wire initiate_reset;
    wire SWCheck;
    var_clock clock_6p25MHZ(.clk(clk) , .M(7) , .SLOW_CLOCK(clk6p25m));
    wire clk200hz;
    var_clock twohundredhz(.clk(clk) , .M(249_999) , . SLOW_CLOCK(clk200hz));
    assign start_game = SWCheck;
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
    wire player1_isReviving,player2_isReviving,player3_isReviving,player4_isReviving;
    PixelControl pixelColourControl(
        .clk100mhz(clk), .clk6p25m(clk6p25m),
        .initiate_reset(initiate_reset),
        .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
        .SW(SW),
        .pixel_index(pixel_index), .pixel_data(pixel_data) ,
        .DebouncedBtnC(DebouncedBtnC) ,
        .led(led),
        .reset(SW[14]), .masterToggle(SW[15]),
        .master_tx(master_tx), .master_rx(master_rx), .slave_rx(slave_rx), .slave_tx(slave_tx),
        .player1_isReviving(player1_isReviving),
        .player2_isReviving(player2_isReviving),
        .player3_isReviving(player3_isReviving),
        .player4_isReviving(player4_isReviving),
        .start_game(start_game), .SWCheck(SWCheck)
    );
    //////////////////////////////////////////////////////////////////////////
    //current uart siwtch clashes with instant explosions
    ////////////////////////////////////////////////////////////////////////
    reg reset = 1'b0;
    Oled_Display Oled_display(
        clk6p25m, 
        reset, 
        frame_begin, sending_pixels,sample_pixel, 
        pixel_index, pixel_data, 
        JC[0], JC[1] , JC[3], JC[4], JC[5], JC[6],JC[7]
    );
    
    SevenSegDisplay SevenSegControl(
        .clk6p25m(clk6p25m), .clk200hz(clk200hz),
        .an(an),
        .seg(seg),
        .dp(dp) ,
        .start_game(start_game)
    );     
    
    GameReset ResetControl(
        .clk6p25m(clk6p25m),
        .SW1(SW[1]),
        .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) ,
        .initiate_reset(initiate_reset)
    );
    
    wire[7:0] player1_deathcount;
    PlayerDeath PlayerDeathControl(
        .clk200hz(clk200hz),
        .start_game(start_game),
        .player1_isReviving(player1_isReviving),
        .player1_deathcount(player1_deathcount)
    );
    
endmodule
