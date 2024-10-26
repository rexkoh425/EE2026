`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 21:48:34
// Design Name: 
// Module Name: WithinXY
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


module WithinXY(
    input [6:0] PlayerMinX , PlayerMaxX , 
    input [5:0] PlayerMinY , PlayerMaxY ,
    input[6:0] min_x , max_x , 
    input[5:0] min_y , max_y , 
    output collided
);
    assign collided = ~(
        PlayerMaxX < min_x ||
        PlayerMinX > max_x ||
        PlayerMinY > max_y ||
        PlayerMaxY < min_y
    );
    
    
endmodule
