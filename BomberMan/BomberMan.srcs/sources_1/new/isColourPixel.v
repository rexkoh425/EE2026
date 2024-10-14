`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 21:38:44
// Design Name: 
// Module Name: isColourPixel
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

/////////////////
//This actually only checks whether the pixel index is in the range of x and y
/////////////////
module isColourPixel(input[6:0] min_x , max_x , input[5:0] min_y , max_y , input[12:0] pixel_index ,output isColouredPixel);
    wire[6:0] x_coor;
    assign x_coor = (pixel_index % 96);
    wire[5:0] y_coor;
    assign y_coor = (pixel_index / 96);
    assign isColouredPixel = (x_coor >= min_x && x_coor <= max_x)
                           && (y_coor >= min_y && y_coor <= max_y);
endmodule