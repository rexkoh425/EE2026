`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 09:29:09
// Design Name: 
// Module Name: EndGame
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


module EndGame(
    input[5:0] player1_deathcount ,player2_deathcount,player3_deathcount,player4_deathcount,
    output EndGame
    );
    
    parameter[2:0] deathcount = 4;
    assign EndGame = (player1_deathcount >= deathcount) || (player2_deathcount >= deathcount) || (player3_deathcount >= deathcount) || (player4_deathcount >= deathcount);
endmodule
