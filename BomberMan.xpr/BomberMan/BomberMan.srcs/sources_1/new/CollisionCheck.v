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


module CollisionCheck(
    input [6:0] PlayerMinX , PlayerMaxX , 
    input [5:0] PlayerMinY , PlayerMaxY ,
    output isCollisionWithImmutable
);
    
    wire block1, block2, block3, block4, block5, block6, block7, block8, block9, block10, 
    block11, block12, block13, block14, block15 , TopWall , LeftWall , RightWall , BottomWall;
    
    WithinXY Block12(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(10) , .max_y(18) , .collided(block1));
    WithinXY Block14(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(10) , .max_y(18) , .collided(block2));
    WithinXY Block16(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(10) , .max_y(18) , .collided(block3));
    WithinXY Block18(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(10) , .max_y(18) , .collided(block4));
    WithinXY Block20(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(10) , .max_y(18) , .collided(block5));
    WithinXY Block32(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(28) , .max_y(36) , .collided(block6));
    WithinXY Block34(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(28) , .max_y(36) , .collided(block7));
    WithinXY Block36(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(28) , .max_y(36) , .collided(block8));
    WithinXY Block38(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(28) , .max_y(36) , .collided(block9));
    WithinXY Block40(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(28) , .max_y(36) , .collided(block10));
    WithinXY Block52(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(46) , .max_y(54) , .collided(block11));
    WithinXY Block54(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(46) , .max_y(54) , .collided(block12));
    WithinXY Block56(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(46) , .max_y(54) , .collided(block13));
    WithinXY Block58(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(46) , .max_y(54) , .collided(block14));
    WithinXY Block60(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(46) , .max_y(54) , .collided(block15));
    WithinXY Top(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(0) , .max_x(95) , .min_y(0) , .max_y(0) , .collided(TopWall));
    WithinXY Left(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(0) , .max_x(2) , .min_y(0) , .max_y(63) , .collided(LeftWall));
    WithinXY Right(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(93) , .max_x(95) , .min_y(0) , .max_y(63) , .collided(RightWall));
    //WithinXY Bottom(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(0) , .max_x(95) , .min_y(64) , .max_y(64) , .collided(BottomWall));
    
    assign isCollisionWithImmutable = block1| block2| block3 | block4 | block5 | block6 | block7 | block8 | block9 | block10 | block11 | block12 | block13 | block14 | block15 | TopWall | LeftWall | RightWall;
endmodule
