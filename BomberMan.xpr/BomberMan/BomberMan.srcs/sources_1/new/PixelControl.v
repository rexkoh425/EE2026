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
    input initiate_reset,
    input btnU , btnD , btnL , btnR , btnC ,
    input [15:0]Player1SW , 
    input Player1DebouncedBtnC ,
    input [12:0] pixel_index ,
    input start_game,
    input reset, masterToggle, master_rx,
    input [1:0] slave_rx,
    output[15:0] pixel_data ,
    output led, slave_tx, testLed, led3,
    output [1:0] master_tx,
    output player1_isReviving
);
   parameter dimensions = 9;
   parameter minX = 3 ,maxX = 93;
   parameter minY = 1 , maxY = 64;
   parameter player_dimensions = 7;
   //Squaretracker tracks player
   //Concrete blocks builds concrete blocks
   //Collision tracker in PlayerMovement tracks if player hit concrete
   
   wire CenterBlock , walls;
    
   ConcreteBlocks #(dimensions,minX,maxX,minY,maxY) ConcreteBlock(
      .pixel_index(pixel_index) ,
      .walls(walls) , .CenterBlock(CenterBlock)
   );
   
   wire player1;
   wire[6:0] Player1MinX , Player1MaxX;
   wire[5:0] Player1MinY , Player1MaxY;
   wire[6:0] Player1Block;
   
   wire player2;
   wire[6:0] Player2MinX , Player2MaxX;
   wire[5:0] Player2MinY , Player2MaxY;
   wire[6:0] Player2Block;
   
   PlayerMovement 
   #(minX+1,minX+player_dimensions,minY+1,minY + player_dimensions,dimensions,minX,maxX,minY,maxY) 
   Player1MovementControl (
       .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
       .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
       .pixel_index(pixel_index) ,
       .player(player1),
       .PlayerMinX(Player1MinX) , .PlayerMaxX(Player1MaxX) ,
       .PlayerMinY(Player1MinY) , .PlayerMaxY(Player1MaxY) ,
       .player1_isReviving(player1_isReviving),
       .isCollideLed(led) ,
       .start_game(start_game), .initiate_reset(initiate_reset),
       .Player1Block(Player1Block)
   );
   
   wire bomb;
   wire ExplosionAnimations;
   wire player1_die , player2_die;

   Bomb BombControl(
       .clk6p25m(clk6p25m),
       .pixel_index(pixel_index) ,
       .Player1Block(Player1Block) ,
       .bomb(bomb),
       .Player1DebouncedBtnC(Player1DebouncedBtnC), 
       .Player1SW(Player1SW),
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