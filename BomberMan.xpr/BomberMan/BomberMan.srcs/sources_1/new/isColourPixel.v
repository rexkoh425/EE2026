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

    assign isColouredPixel = ((pixel_index % 96) >= min_x && (pixel_index % 96) <= max_x)
                           && ((pixel_index / 96) >= min_y && (pixel_index / 96) <= max_y);
endmodule