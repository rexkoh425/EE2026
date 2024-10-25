`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 12:10:36
// Design Name: 
// Module Name: Walls
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


module Walls(
    input[12:0] pixel_index , 
    output walls
);
    wire TopWall , LeftWall , RightWall , BottomWall;
    isColourPixel TopBlock(.min_x(0) , .max_x(95) , .min_y(0) , .max_y(0) , .pixel_index(pixel_index) , .isColouredPixel(TopWall));
    isColourPixel LeftBlock(.min_x(0) , .max_x(2) , .min_y(0) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(LeftWall));
    isColourPixel RightBlock(.min_x(93) , .max_x(95) , .min_y(0) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(RightWall));
    isColourPixel BottomBlock(.min_x(1) , .max_x(0) , .min_y(1) , .max_y(0) , .pixel_index(pixel_index) , .isColouredPixel(BottomWall));
    assign walls = TopWall | LeftWall | RightWall | BottomWall;
endmodule
