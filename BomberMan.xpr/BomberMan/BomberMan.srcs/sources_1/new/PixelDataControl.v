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


module PixelDataControl(
    input clk6p25m , 
    input player1_die, player2_die,
    input CenterBlock , walls , player1 , bomb1 , ExplosionAnimations, 
    input player2, ExplosionAnimations2, bomb2,
    output reg[15:0] pixel_data = 16'b0 ,
    output player1_isReviving, player2_isReviving
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
   wire player1_status, player2_status;

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
   always @(posedge clk6p25m)
   begin
       if(CenterBlock)
       begin
           pixel_data <= DARK_GREY;
       end
       else if(walls)
           pixel_data <= BROWN;
       else if(player1_status || player2_status)
           pixel_data <= GREEN;
       else if(ExplosionAnimations || ExplosionAnimations2)
           pixel_data <= ORANGE;
       else if(bomb1 || bomb2)
           pixel_data <= RED;
       else
           pixel_data <= BLACK;
           
   end
endmodule
