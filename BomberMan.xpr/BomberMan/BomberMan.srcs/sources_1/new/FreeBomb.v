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
    input Player1DebouncedBtnC , 
    input start_game,
    input player1_isReviving,
    output reg[7:0] FreeBomb = Maxbombcount - 1,
    output reg edge_registered = 0 ,
    output reg [(Maxbombcount * 2) - 1 : 0] WhichPlayerBomb = 0
);

    integer k;
    reg reassign = 1;
    reg[1:0] triggered_player = 0;
    
    always @(posedge clk6p25m)
    begin
        if(Player1DebouncedBtnC == 1 & ~player1_isReviving & start_game)
        begin
            edge_registered <= 1;
            triggered_player <= 0;
        end
        else begin
            edge_registered <= 0;
            if(reassign)
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
        
        if(FreeBomb == 99 | ActiveBombs[FreeBomb] == 1)
        begin
            reassign <= 1;
            WhichPlayerBomb <= WhichPlayerBomb & ~(2'b11 << (FreeBomb * 2));
            WhichPlayerBomb <= WhichPlayerBomb | triggered_player << (FreeBomb * 2);
        end
    end
endmodule
