`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 21:13:13
// Design Name: 
// Module Name: Player
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


module Player(
    input[12:0] pixel_index ,
    input[6:0] PlayerMinX , PlayerMaxX , input[5:0] PlayerMinY , PlayerMaxY ,
    output player
);

    isColourPixel Player1(.min_x(PlayerMinX) , .max_x(PlayerMaxX) , .min_y(PlayerMinY) , .max_y(PlayerMaxY) , .pixel_index(pixel_index) , .isColouredPixel(player));
endmodule
