`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 21:45:29
// Design Name: 
// Module Name: CollisionCheck
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


module CollisionCheck
#(
    parameter dimensions = 9 , 
    parameter minX = 3 ,maxX = 93 ,
    parameter minY = 1 , maxY = 64
)(
    input [6:0] PlayerMinX , PlayerMaxX , 
    input [5:0] PlayerMinY , PlayerMaxY ,
    output isCollisionWithImmutable
);
    localparam num_x_blocks = (maxX - minX) / dimensions; 
    localparam num_y_blocks = (maxY - minY) / dimensions;
    
    genvar x , y;
    wire[((maxY - minY)/dimensions) * ((maxX - minX)/dimensions) - 1 : 0]  block;
    wire TopWall , LeftWall , RightWall , BottomWall;
    generate
        for (x = minX +dimensions; x < maxX; x = x + 2*dimensions) begin : outer_loop
            for (y = minY + dimensions; y < maxY; y = y + 2*dimensions) begin : mod_inst
                WithinXY Block(
                    .PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , 
                    .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , 
                    .min_x(x) , .max_x(x+dimensions-1) , 
                    .min_y(y) , .max_y(y+dimensions-1) , 
                    .collided(block[(num_x_blocks * ((y - minY)/dimensions)) + (((x - minX)/dimensions))])
                );
            end
        end
    endgenerate
        
    WithinXY Top(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(0) , .max_x(95) , .min_y(0) , .max_y(0) , .collided(TopWall));
    WithinXY Left(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(0) , .max_x(2) , .min_y(0) , .max_y(63) , .collided(LeftWall));
    WithinXY Right(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(93) , .max_x(95) , .min_y(0) , .max_y(63) , .collided(RightWall));
    //WithinXY Bottom(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(0) , .max_x(95) , .min_y(64) , .max_y(64) , .collided(BottomWall));
    
    assign isCollisionWithImmutable = |block | TopWall | LeftWall | RightWall;
endmodule
