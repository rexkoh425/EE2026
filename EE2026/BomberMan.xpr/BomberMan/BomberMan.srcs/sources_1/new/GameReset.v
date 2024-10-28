`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 01:18:35
// Design Name: 
// Module Name: GameReset
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


module GameReset(
    input clk6p25m,
    input SW1,
    input btnU , btnD , btnL , btnR ,
    output reg  start_game = 0 ,
    output reg initiate_reset = 0
);
    
    //made it such that player cannot move when all 4 are pressed
    //but player can still press bomb. Details to decide later.
    reg[31:0] count = 0;
    always @ (posedge clk6p25m)
    begin
        if(btnU & btnD & btnL & btnR)
        begin
            initiate_reset <= 1;
            count <= (count == 31_250_000) ? count : count + 1;
        end 
        else begin
            initiate_reset <= 0;
            count <= 0;
        end
        if(SW1)
        begin
            start_game <= 1;
        end
        if(count == 31_250_000)
        begin
            start_game <= 0;
        end
    end
endmodule
