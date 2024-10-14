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
    input [12:0] pixel_index ,
    output[15:0] pixel_data ,
    output led
);
    
    wire CenterBlock , walls;
    
    ConcreteBlocks ConcreteBlock(
       .pixel_index(pixel_index) ,
       .walls(walls) , .CenterBlock(CenterBlock)
   );
   
   wire player;
   wire[6:0] PlayerMinX , PlayerMaxX;
   wire[5:0] PlayerMinY , PlayerMaxY;
   PlayerMovement PlayerMovementControl(
       .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m) , 
       .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
       .pixel_index(pixel_index) ,
       .player(player) ,
       .PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , 
       .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) ,
       .isCollideLed(led)
   );
   
   wire[6:0] BombBlock;
   /*
   SquareTracker TrackUserSquare(
       .clk6p25m(clk6p25m),
       .PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , 
       .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) ,
       .BombBlock(BombBlock)
   );
   */
   wire bomb = 1'b0;
   /*
   Bomb bomb1(
       .clk6p25m(clk6p25m),
       .pixel_index(pixel_index) ,
       .BombBlock(BombBlock) ,
       .bomb(bomb)
   );
   */  
   
   PixelDataControl ColourControl(
       .clk6p25m(clk6p25m) , 
       .walls(walls) , .CenterBlock(CenterBlock), .player(player) , .bomb(bomb) ,
       .pixel_data(pixel_data)
   );
   
endmodule