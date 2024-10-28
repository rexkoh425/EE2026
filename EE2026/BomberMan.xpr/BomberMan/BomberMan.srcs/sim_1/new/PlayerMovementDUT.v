`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 15:17:20
// Design Name: 
// Module Name: PlayerMovementDUT
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


module PlayerMovementDUT();
    
    reg clk6p25m = 0;
    reg walls = 0;
    reg CenterBlock = 0;
    reg[12:0] pixel_index = 0;
    reg[6:0] BombsBlock = 0;
    reg ActiveBombs = 0; 
    wire ExplosionAnimation;
    ExplodeBomb ExplodeAnimation(
        .clk6p25m(clk6p25m) , 
        .pixel_index(pixel_index),
        .BombBlock(BombsBlock),    
        .active(ActiveBombs),   
        .walls(walls) , .CenterBlock(CenterBlock),        
        .ExplosionAnimation(ExplosionAnimation)
    );
       
       initial begin
            #100; 
            walls = 1; CenterBlock = 1;
            BombsBlock = 1;
            ActiveBombs = 1;
       end
       
       always begin
            clk6p25m = ~clk6p25m; #80;
       end
       
       always begin 
            pixel_index <= (pixel_index == 96*64) ? 0 : pixel_index + 1; #5;
       end
endmodule
