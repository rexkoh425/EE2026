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
    input SWCheck ,
    input btnUPlayer1In,btnDPlayer1In,btnLPlayer1In,btnRPlayer1In,btnCPlayer1In,
    btnUPlayer2In,btnDPlayer2In,btnLPlayer2In,btnRPlayer2In,btnCPlayer2In,
    btnUPlayer3In,btnDPlayer3In,btnLPlayer3In,btnRPlayer3In,btnCPlayer3In,
    btnUPlayer4In,btnDPlayer4In,btnLPlayer4In,btnRPlayer4In,btnCPlayer4In,
    output btnUPlayer1,btnDPlayer1,btnLPlayer1,btnRPlayer1,btnCPlayer1,
    btnUPlayer2,btnDPlayer2,btnLPlayer2,btnRPlayer2,btnCPlayer2,
    btnUPlayer3,btnDPlayer3,btnLPlayer3,btnRPlayer3,btnCPlayer3,
    btnUPlayer4,btnDPlayer4,btnLPlayer4,btnRPlayer4,btnCPlayer4
);

    assign btnUPlayer1 = SWCheck ? btnUPlayer1In : 0; 
    assign btnDPlayer1 = SWCheck ? btnDPlayer1In : 0; 
    assign btnLPlayer1 = SWCheck ? btnLPlayer1In : 0; 
    assign btnRPlayer1 = SWCheck ? btnRPlayer1In : 0; 
    assign btnCPlayer1 = SWCheck ? btnCPlayer1In : 0; 
    assign btnUPlayer2 = SWCheck ? btnUPlayer2In : 0; 
    assign btnDPlayer2 = SWCheck ? btnDPlayer2In : 0; 
    assign btnLPlayer2 = SWCheck ? btnLPlayer2In : 0; 
    assign btnRPlayer2 = SWCheck ? btnRPlayer2In : 0; 
    assign btnCPlayer2 = SWCheck ? btnCPlayer2In : 0; 
    assign btnUPlayer3 = SWCheck ? btnUPlayer3In : 0; 
    assign btnDPlayer3 = SWCheck ? btnDPlayer3In : 0; 
    assign btnLPlayer3 = SWCheck ? btnLPlayer3In : 0; 
    assign btnRPlayer3 = SWCheck ? btnRPlayer3In : 0; 
    assign btnCPlayer3 = SWCheck ? btnCPlayer4In : 0; 
    assign btnUPlayer4 = SWCheck ? btnUPlayer4In : 0; 
    assign btnDPlayer4 = SWCheck ? btnDPlayer4In : 0; 
    assign btnLPlayer4 = SWCheck ? btnLPlayer4In : 0; 
    assign btnRPlayer4 = SWCheck ? btnRPlayer4In : 0; 
    assign btnCPlayer4 = SWCheck ? btnCPlayer4In : 0; 
    
          
endmodule
