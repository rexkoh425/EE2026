`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:24:55
// Design Name: 
// Module Name: Bomb
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


module Bomb(
    input[6:0] clk6p25m,
    input[12:0] pixel_index ,
    input[6:0] BombBlock ,
    output bomb
);  

    reg[3:0] xBlock;
    reg [2:0] yBlock;
    reg[6:0] BombMinX , BombMaxX;
    reg[5:0] BombMinY , BombMaxY;
    parameter dimension = 9;
    
    always @ (clk6p25m)
    begin
        xBlock <= (BombBlock % 10) + 1;
        yBlock <= (BombBlock / 10) + 1;
        BombMinX <= 3 + (xBlock-1) * dimension;
        BombMaxX <= 3 + (xBlock * dimension) - 1;
        BombMinY <= 1 + (yBlock -1) * dimension;
        BombMaxY <= 1 + (yBlock * dimension) - 1;
    end
    
    isColourPixel BombDrop(.min_x(BombMinX) , .max_x(BombMaxX) , .min_y(BombMinY) , .max_y(BombMaxY) , .pixel_index(pixel_index) , .isColouredPixel(bomb));
endmodule
