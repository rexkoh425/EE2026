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
    input DebouncedBtnC ,
    input [12:0] pixel_index ,
    input start_game,
    input reset, masterToggle, master_rx,
    input [1:0] slave_rx,
    output[15:0] pixel_data ,
    output slave_tx, testLed, led3,
    output [1:0] master_tx,
    output player1_isReviving,player2_isReviving,player3_isReviving,player4_isReviving
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
   /////////////////////////////////////////////////////////////////////////
   //self implemented uart sections
   wire player1;
   wire[6:0] Player1MinX , Player1MaxX;
   wire[5:0] Player1MinY , Player1MaxY;
   wire btnUPlayer1,btnDPlayer1,btnLPlayer1,btnRPlayer1,btnCPlayer1,Player1DebouncedBtnC;
   wire[6:0] Player1Block;
   wire player1_die;
   
   assign btnUPlayer1 = SW[5] ? btnU : 0;
   assign btnDPlayer1 = SW[5] ? btnD : 0;
   assign btnLPlayer1 = SW[5] ? btnL : 0;
   assign btnRPlayer1 = SW[5] ? btnR : 0;
   assign btnCPlayer1 = SW[5] ? btnC : 0;
   assign Player1DebouncedBtnC = SW[5] ? DebouncedBtnC : 0;
   
   wire btnUPlayer2,btnDPlayer2,btnLPlayer2,btnRPlayer2,btnCPlayer2 ,Player2DebouncedBtnC;
   wire player2;
   wire[6:0] Player2MinX , Player2MaxX;
   wire[5:0] Player2MinY , Player2MaxY;
   wire[6:0] Player2Block;
   wire player2_die;
   
   assign btnUPlayer2 = SW[6] ? btnU : 0;
   assign btnDPlayer2 = SW[6] ? btnD : 0;
   assign btnLPlayer2 = SW[6] ? btnL : 0;
   assign btnRPlayer2 = SW[6] ? btnR : 0;
   assign btnCPlayer2 = SW[6] ? btnC : 0;
   assign Player2DebouncedBtnC = SW[6] ? DebouncedBtnC : 0;
      
   wire btnUPlayer3,btnDPlayer3,btnLPlayer3,btnRPlayer3,btnCPlayer3, Player3DebouncedBtnC;
   wire player3;
   wire[6:0] Player3MinX , Player3MaxX;
   wire[5:0] Player3MinY , Player3MaxY;
   wire[6:0] Player3Block;
   wire player3_die;
   
   assign btnUPlayer3 = SW[7] ? btnU : 0;
   assign btnDPlayer3 = SW[7] ? btnD : 0;
   assign btnLPlayer3 = SW[7] ? btnL : 0;
   assign btnRPlayer3 = SW[7] ? btnR : 0;
   assign btnCPlayer3 = SW[7] ? btnC : 0;
   assign Player3DebouncedBtnC = SW[7] ? DebouncedBtnC : 0;
      
   wire btnUPlayer4,btnDPlayer4,btnLPlayer4,btnRPlayer4,btnCPlayer4,Player4DebouncedBtnC;
   wire player4;
   wire[6:0] Player4MinX , Player4MaxX;
   wire[5:0] Player4MinY , Player4MaxY;
   wire[6:0] Player4Block;
   wire player4_die;
   
   assign btnUPlayer4 = SW[8] ? btnU : 0;
   assign btnDPlayer4 = SW[8] ? btnD : 0;
   assign btnLPlayer4 = SW[8] ? btnL : 0;
   assign btnRPlayer4 = SW[8] ? btnR : 0;
   assign btnCPlayer4 = SW[8] ? btnC : 0;
   assign Player4DebouncedBtnC = SW[8] ? DebouncedBtnC : 0;
   /////////////////////////////////////////////////////////////////////////////////////////////
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
    
    PlayerMovement 
    #(4,10,57,63,dimensions,minX,maxX,minY,maxY) 
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
    
    PlayerMovement 
    #(87,93,57,63,dimensions,minX,maxX,minY,maxY) 
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
       .player1_die(player1_die), .player2_die(player2_die), .player3_die(player3_die), .player4_die(player4_die),
       .walls(walls) , .CenterBlock(CenterBlock), 
       .player1(player1) , .player2(player2) ,.player3(player3) ,.player4(player4) ,
       .bomb(bomb) , .ExplosionAnimations(ExplosionAnimations),
       .pixel_data(pixel_data) ,
       .player1_isReviving(player1_isReviving) , .player2_isReviving(player2_isReviving) ,
       .player3_isReviving(player3_isReviving) , .player4_isReviving(player4_isReviving) ,
       .start_game(start_game)
   );
   
   //always @ 
endmodule