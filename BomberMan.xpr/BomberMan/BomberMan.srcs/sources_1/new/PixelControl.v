`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 11:36:52
// Design Name: 
// Module Name: PixelControl
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


module PixelControl(
    input clk100mhz ,clk6p25m ,
    input btnU , btnD , btnL , btnR , btnC ,
    input DebouncedBtnC ,
    input [12:0] pixel_index ,
    input start_game,
    output[15:0] pixel_data ,
    output led,
    output player1_isReviving
);
    
    wire CenterBlock , walls;
    
   ConcreteBlocks ConcreteBlock(
      .pixel_index(pixel_index) ,
      .walls(walls) , .CenterBlock(CenterBlock)
   );
   
   wire player1;
   wire[6:0] Player1MinX , Player1MaxX;
   wire[5:0] Player1MinY , Player1MaxY;
   
   PlayerMovement #(4,10,2,8) PlayerMovementControl (
       .clk100mhz(clk100mhz) , 
       .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
       .pixel_index(pixel_index) ,
       .player(player1),
       .PlayerMinX(Player1MinX) , .PlayerMaxX(Player1MaxX) ,
       .PlayerMinY(Player1MinY) , .PlayerMaxY(Player1MaxY) ,
       .player1_isReviving(player1_isReviving),
       .isCollideLed(led) ,
       .start_game(start_game)
   );
   
   wire[6:0] Player1Block; 
   SquareTracker TrackPlayer1Square(
       .clk6p25m(clk6p25m),
       .PlayerMinX(Player1MinX) , .PlayerMaxX(Player1MaxX) , 
       .PlayerMinY(Player1MinY) , .PlayerMaxY(Player1MaxY) ,
       .Player1Block(Player1Block)
   );
   
   wire bomb;
   wire ExplosionAnimations;
   wire player1_die;

   Bomb BombControl(
       .clk6p25m(clk6p25m),
       .pixel_index(pixel_index) ,
       .Player1Block(Player1Block) ,
       .bomb(bomb),
       .DebouncedBtnC(DebouncedBtnC), 
       .ExplosionAnimations(ExplosionAnimations),
       .player1_die(player1_die) ,
       .player1_isReviving(player1_isReviving),
       .start_game(start_game)
   );
   
   PixelDataControl ColourControl(
       .clk6p25m(clk6p25m) , 
       .player1_die(player1_die),
       .walls(walls) , .CenterBlock(CenterBlock), .player1(player1) , .bomb(bomb) , .ExplosionAnimations(ExplosionAnimations),
       .pixel_data(pixel_data) ,
       .player1_isReviving(player1_isReviving) ,
       .start_game(start_game)
   );
   
endmodule