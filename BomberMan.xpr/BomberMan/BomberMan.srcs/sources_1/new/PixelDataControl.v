`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 23:26:08
// Design Name: 
// Module Name: PixelDataControl
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

//to handle death of individual players
module PixelDataControl(
    input clk6p25m , input[12:0] pixel_index,
    input player1_die,player2_die,player3_die,player4_die,
    input CenterBlock , walls , 
    input player1 , player2 , player3 , player4 , 
    input bomb , ExplosionAnimations,
    input start_game ,
    output reg[15:0] pixel_data = 16'b0 ,
    output player1_isReviving ,player2_isReviving,player3_isReviving,player4_isReviving
);
   wire[15:0] WHITE = 16'hFFFF;
   wire[15:0] BLUE = 16'h001F;
   wire[15:0] GREEN = 16'h07E0;
   wire[15:0] RED = 16'hF800;
   wire[15:0] BLACK = 16'h0000;
   wire[15:0] DARK_GREY = 16'h1042;
   wire[15:0] BROWN = 16'hA52A;
   wire[15:0] ORANGE = 16'hFCA0;
   
   wire PlayerBlinkClk;
   var_clock player_blink(clk6p25m , 32'd624999 , PlayerBlinkClk);
   wire player1_status , player2_status,player3_status,player4_status , player_status;
   assign player_status = player1_status | player2_status | player3_status | player4_status;
   
   AnimateDeath Player1(
       .clk6p25m(clk6p25m), .PlayerBlinkClk(PlayerBlinkClk),
       .player(player1),
       .player_die(player1_die),
       .player_status(player1_status),
       .isReviving(player1_isReviving)
   );
   
   AnimateDeath Player2(
      .clk6p25m(clk6p25m), .PlayerBlinkClk(PlayerBlinkClk),
      .player(player2),
      .player_die(player2_die),
      .player_status(player2_status),
      .isReviving(player2_isReviving)
    );
      
      
    AnimateDeath Player3(
        .clk6p25m(clk6p25m), .PlayerBlinkClk(PlayerBlinkClk),
        .player(player3),
        .player_die(player3_die),
        .player_status(player3_status),
        .isReviving(player3_isReviving)
    );
       
         
    AnimateDeath Player4(
        .clk6p25m(clk6p25m), .PlayerBlinkClk(PlayerBlinkClk),
        .player(player4),
        .player_die(player4_die),
        .player_status(player4_status),
        .isReviving(player4_isReviving)
    );
            
   wire[15:0] ss_pixeldata;
   StartingScreen start(
    .clk6p25m(clk6p25m),
    .pixel_index(pixel_index),
    .pixel_data(ss_pixeldata)
  );
   always @(posedge clk6p25m)
   begin
       
       if(~start_game)
       begin
           pixel_data <= ss_pixeldata;
       end
       else if(CenterBlock)
       begin
           pixel_data <= DARK_GREY;
       end
       else if(walls)
           pixel_data <= BROWN;
       else if(player_status)
           pixel_data <= GREEN;
       else if(ExplosionAnimations)
           pixel_data <= ORANGE;
       else if(bomb)
           pixel_data <= RED;
       else
           pixel_data <= BLACK;
       
   end
endmodule
