`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 16:30:15
// Design Name: 
// Module Name: FreeBomb
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


module FreeBomb #(parameter[6:0] Maxbombcount = 5)(
    input clk6p25m ,
    input [Maxbombcount-1 : 0]ActiveBombs,
    input Player1DebouncedBtnC , Player2DebouncedBtnC , Player3DebouncedBtnC , Player4DebouncedBtnC , 
    input start_game,
    input player1_isReviving,player2_isReviving,player3_isReviving,player4_isReviving,
    output reg[7:0] FreeBomb = Maxbombcount - 1,
    output reg edge_registered = 0
);

    integer k;
    reg reassign = 1;
    reg[1:0] triggered_player = 0;
    //i think can only assign once every 200ms sia
    always @(posedge clk6p25m)
    begin
        if(Player1DebouncedBtnC == 1 & ~player1_isReviving & start_game & ~edge_registered)
        begin
            edge_registered <= 1;
            triggered_player <= 0;
        end
        else if(Player2DebouncedBtnC == 1 & ~player2_isReviving & start_game & ~edge_registered)
        begin
            edge_registered <= 1;
            triggered_player <= 1;
        end
        else if(Player3DebouncedBtnC == 1 & ~player3_isReviving & start_game & ~edge_registered)
        begin
            edge_registered <= 1;
            triggered_player <= 2;
        end
        else if(Player4DebouncedBtnC == 1 & ~player4_isReviving & start_game & ~edge_registered)
        begin
            edge_registered <= 1;
            triggered_player <= 3;
        end
        else begin
            edge_registered <= 0;
            if(~edge_registered & reassign)
            begin
                FreeBomb <= 99;
                                            
                for(k = 0 ; k < Maxbombcount ; k = k+1)
                begin
                    if(ActiveBombs[k] == 0)
                    begin
                        if(k != FreeBomb)
                        begin
                            FreeBomb <= k;
                            reassign <= 0;
                        end
                    end
                end
            end
        end
        //maybe last 2 bombs cannot use cause of smt in this logics
        if(FreeBomb == 99 | ActiveBombs[FreeBomb] == 1)
        begin
            reassign <= 1;
        end
    end
endmodule
