`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 21:24:31
// Design Name: 
// Module Name: BlockColourPixel
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


module BlockColourPixel #(parameter[6:0] dimension = 9 , parameter[6:0] MaxBlocks = 69)(
    input[6:0] BombBlock,
    input[12:0] pixel_index ,
    output isColouredPixel
);
        
        wire[3:0] xBlock;
        wire[2:0] yBlock;
        wire[6:0] min_x , max_x;
        wire[5:0] min_y , max_y;
        assign xBlock = (BombBlock % 10) + 1;
        assign yBlock = (BombBlock / 10) + 1;
        assign min_x = 3 + (xBlock - 1) * dimension;
        assign max_x = 3 + (xBlock * dimension) - 1;
        assign min_y = 1 + (yBlock - 1) * dimension;
        assign max_y = 1 + (yBlock * dimension) - 1;
        wire[6:0] x_coor;
        assign x_coor = (pixel_index % 96);
        wire[5:0] y_coor;
        assign y_coor = (pixel_index / 96);
        assign isColouredPixel = (BombBlock >= 0 && BombBlock <= MaxBlocks) 
        ? (x_coor >= min_x && x_coor <= max_x)&& (y_coor >= min_y && y_coor <= max_y)
        : 0;
endmodule
