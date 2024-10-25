`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 19:43:17
// Design Name: 
// Module Name: BlockIsImmutable
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

//copied from ConcreteBlock module
module BlockIsImmutable(
    input[6:0] BombBlock,
    output Immutable
    );
    
    assign Immutable = (BombBlock == 11) | (BombBlock == 13) | (BombBlock == 15) | (BombBlock == 17) | (BombBlock == 19) | (BombBlock == 31) | (BombBlock == 33) | (BombBlock == 35) | (BombBlock == 37) | (BombBlock == 39) | (BombBlock == 51) | (BombBlock == 53) | (BombBlock == 55) | (BombBlock == 57) | (BombBlock == 59);
endmodule
