`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 00:17:20
// Design Name: 
// Module Name: ButtonGate
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


module ButtonGate(
    input SWCheck , input[3:0] player_dead,
    input btnUPlayer1In,btnDPlayer1In,btnLPlayer1In,btnRPlayer1In,btnCPlayer1In,
    btnUPlayer2In,btnDPlayer2In,btnLPlayer2In,btnRPlayer2In,btnCPlayer2In,
    btnUPlayer3In,btnDPlayer3In,btnLPlayer3In,btnRPlayer3In,btnCPlayer3In,
    btnUPlayer4In,btnDPlayer4In,btnLPlayer4In,btnRPlayer4In,btnCPlayer4In,
    output btnUPlayer1,btnDPlayer1,btnLPlayer1,btnRPlayer1,btnCPlayer1,
    btnUPlayer2,btnDPlayer2,btnLPlayer2,btnRPlayer2,btnCPlayer2,
    btnUPlayer3,btnDPlayer3,btnLPlayer3,btnRPlayer3,btnCPlayer3,
    btnUPlayer4,btnDPlayer4,btnLPlayer4,btnRPlayer4,btnCPlayer4
);

    assign btnUPlayer1 = (SWCheck & ~player_dead[0]) ? btnUPlayer1In : 0; 
    assign btnDPlayer1 = (SWCheck & ~player_dead[0]) ? btnDPlayer1In : 0; 
    assign btnLPlayer1 = (SWCheck & ~player_dead[0]) ? btnLPlayer1In : 0; 
    assign btnRPlayer1 = (SWCheck & ~player_dead[0]) ? btnRPlayer1In : 0; 
    assign btnCPlayer1 = (SWCheck & ~player_dead[0]) ? btnCPlayer1In : 0; 
    assign btnUPlayer2 = (SWCheck & ~player_dead[1]) ? btnUPlayer2In : 0; 
    assign btnDPlayer2 = (SWCheck & ~player_dead[1]) ? btnDPlayer2In : 0; 
    assign btnLPlayer2 = (SWCheck & ~player_dead[1]) ? btnLPlayer2In : 0; 
    assign btnRPlayer2 = (SWCheck & ~player_dead[1]) ? btnRPlayer2In : 0; 
    assign btnCPlayer2 = (SWCheck & ~player_dead[1]) ? btnCPlayer2In : 0; 
    assign btnUPlayer3 = (SWCheck & ~player_dead[2]) ? btnUPlayer3In : 0; 
    assign btnDPlayer3 = (SWCheck & ~player_dead[2]) ? btnDPlayer3In : 0; 
    assign btnLPlayer3 = (SWCheck & ~player_dead[2]) ? btnLPlayer3In : 0; 
    assign btnRPlayer3 = (SWCheck & ~player_dead[2]) ? btnRPlayer3In : 0; 
    assign btnCPlayer3 = (SWCheck & ~player_dead[2]) ? btnCPlayer3In : 0; 
    assign btnUPlayer4 = (SWCheck & ~player_dead[3]) ? btnUPlayer4In : 0; 
    assign btnDPlayer4 = (SWCheck & ~player_dead[3]) ? btnDPlayer4In : 0; 
    assign btnLPlayer4 = (SWCheck & ~player_dead[3]) ? btnLPlayer4In : 0; 
    assign btnRPlayer4 = (SWCheck & ~player_dead[3]) ? btnRPlayer4In : 0; 
    assign btnCPlayer4 = (SWCheck & ~player_dead[3]) ? btnCPlayer4In : 0; 
    
          
endmodule
