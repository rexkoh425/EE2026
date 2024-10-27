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
    input [15:0]SW , 
    input Player1DebouncedBtnC ,
    input [12:0] pixel_index ,
    input start_game,
    input reset, masterToggle, master_rx,
    input [1:0] slave_rx,
    output[15:0] pixel_data ,
    output slave_tx, testLed, led3,
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
   reg btnUPlayer1,btnDPlayer1,btnLPlayer1,btnRPlayer1,btnCPlayer1;
   wire[6:0] Player1Block;
   wire player1_die;
   
   PlayerMovement 
   #(4,10,2,8,dimensions,minX,maxX,minY,maxY) 
   Player1MovementControl(
       .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
       //.btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
       .btnU(btnUPlayer1) , .btnD(btnDPlayer1) , .btnL(btnLPlayer1) , .btnR(btnRPlayer1) , .btnC(btnCPlayer1) ,
       .pixel_index(pixel_index) ,
       .player_isReviving(player1_isReviving),
       .start_game(start_game), .initiate_reset(initiate_reset),
       ////output
       .player(player1),
       .PlayerMinX(Player1MinX) , .PlayerMaxX(Player1MaxX) ,
       .PlayerMinY(Player1MinY) , .PlayerMaxY(Player1MaxY) ,
       .PlayerBlock(Player1Block)
   );
   
  reg btnUPlayer2,btnDPlayer2,btnLPlayer2,btnRPlayer2,btnCPlayer2;
  reg Player2DebouncedBtnC;
  wire player2;
  wire[6:0] Player2MinX , Player2MaxX;
  wire[5:0] Player2MinY , Player2MaxY;
  wire[6:0] Player2Block;
  wire player2_isReviving;
  wire player2_die;
  
  PlayerMovement 
  #(87,93,2,8,dimensions,minX,maxX,minY,maxY) 
  Player2MovementControl(
      .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
      .btnU(btnUPlayer2) , .btnD(btnDPlayer2) , .btnL(btnLPlayer2) , .btnR(btnRPlayer2) , .btnC(btnCPlayer2) ,
      .pixel_index(pixel_index) ,
      .player_isReviving(player2_isReviving),
      .start_game(start_game), .initiate_reset(initiate_reset),
      ////output
      .player(player2),
      .PlayerMinX(Player2MinX) , .PlayerMaxX(Player2MaxX) ,
      .PlayerMinY(Player2MinY) , .PlayerMaxY(Player2MaxY) ,
      .PlayerBlock(Player2Block)
  );
  
    reg btnUPlayer3,btnDPlayer3,btnLPlayer3,btnRPlayer3,btnCPlayer3;
    reg Player3DebouncedBtnC;
    wire player3;
    wire[6:0] Player3MinX , Player3MaxX;
    wire[5:0] Player3MinY , Player3MaxY;
    wire[6:0] Player3Block;
    wire player3_isReviving;
    wire player3_die;
    
    PlayerMovement 
    #(4,10,56,63,dimensions,minX,maxX,minY,maxY) 
    Player3MovementControl(
        .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
        .btnU(btnUPlayer3) , .btnD(btnDPlayer3) , .btnL(btnLPlayer3) , .btnR(btnRPlayer3) , .btnC(btnCPlayer3) ,
        .pixel_index(pixel_index) ,
        .player_isReviving(player3_isReviving),
        .start_game(start_game), .initiate_reset(initiate_reset),
        ////output
        .player(player3),
        .PlayerMinX(Player3MinX) , .PlayerMaxX(Player3MaxX) ,
        .PlayerMinY(Player3MinY) , .PlayerMaxY(Player3MaxY) ,
        .PlayerBlock(Player3Block)
    );
    
    reg btnUPlayer4,btnDPlayer4,btnLPlayer4,btnRPlayer4,btnCPlayer4;
    reg Player4DebouncedBtnC;
    wire player4;
    wire[6:0] Player4MinX , Player4MaxX;
    wire[5:0] Player4MinY , Player4MaxY;
    wire[6:0] Player4Block;
    wire player4_isReviving;
    wire player4_die;
    
    PlayerMovement 
    #(87,93,56,63,dimensions,minX,maxX,minY,maxY) 
    Player4MovementControl(
        .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
        .btnU(btnUPlayer4) , .btnD(btnDPlayer4) , .btnL(btnLPlayer4) , .btnR(btnRPlayer4) , .btnC(btnCPlayer4) ,
        .pixel_index(pixel_index) ,
        .player_isReviving(player4_isReviving),
        .start_game(start_game), .initiate_reset(initiate_reset),
        ////output
        .player(player4),
        .PlayerMinX(Player4MinX) , .PlayerMaxX(Player4MaxX) ,
        .PlayerMinY(Player4MinY) , .PlayerMaxY(Player4MaxY) ,
        .PlayerBlock(Player4Block)
    );
   
   wire bomb;
   wire ExplosionAnimations;

   Bomb BombControl(
       .clk6p25m(clk6p25m),
       .pixel_index(pixel_index) ,
       .bomb(bomb),.SW(SW),
       .Player1Block(Player1Block) ,
       .Player1DebouncedBtnC(Player1DebouncedBtnC), 
       .player1_die(player1_die),
       .player1_isReviving(player1_isReviving),
       .Player2Block(Player2Block) ,
       .Player2DebouncedBtnC(Player2DebouncedBtnC), 
       .player2_die(player2_die),
       .player2_isReviving(player3_isReviving),
       .Player3Block(Player3Block) ,
       .Player3DebouncedBtnC(Player3DebouncedBtnC), 
       .player3_die(player3_die),
       .player3_isReviving(player3_isReviving),
       .Player4Block(Player4Block),
       .Player4DebouncedBtnC(Player4DebouncedBtnC), 
       .player4_die(player4_die),
       .player4_isReviving(player4_isReviving),
       .ExplosionAnimations(ExplosionAnimations),
       .start_game(start_game)
   );
   
   PixelDataControl ColourControl(
       .clk6p25m(clk6p25m) , 
       .player1_die(player1_die),
       .walls(walls) , .CenterBlock(CenterBlock), .player1(player1 | player2 | player3 | player4 ) , 
       .bomb(bomb) , .ExplosionAnimations(ExplosionAnimations),
       .pixel_data(pixel_data) ,
       .player1_isReviving(player1_isReviving) ,
       .start_game(start_game)
   );
   
   //always @ 
endmodule