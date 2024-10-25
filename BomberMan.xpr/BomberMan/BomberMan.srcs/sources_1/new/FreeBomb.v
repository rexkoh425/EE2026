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
    input DebouncedBtnC , 
    input start_game,
    input player1_isReviving,
    output reg[7:0] FreeBomb = Maxbombcount - 1,
    output reg edge_registered = 0
);

    integer k;
    reg reassign = 1;
    
    always @(posedge clk6p25m)
    begin
        if(DebouncedBtnC == 1 & ~player1_isReviving & start_game)
        begin
            edge_registered <= 1;
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
        
        if(ActiveBombs[FreeBomb] == 1)
        begin
            reassign <= 1;
        end
    end
endmodule
