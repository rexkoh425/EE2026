`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 16:09:25
// Design Name: 
// Module Name: FreeBombDut
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


module FreeBombDut();
    parameter[6:0] Maxbombcount = 3;
    reg clk6p25m;
    reg [Maxbombcount-1 : 0]ActiveBombs;
    reg Player1DebouncedBtnC;
    reg start_game;
    reg player1_isReviving;
    reg [7:0] FreeBomb = 99;
    reg edge_registered = 0;

    initial begin
        clk6p25m = 0;
        player1_isReviving = 0;
        start_game = 1;
        Player1DebouncedBtnC = 0;
        ActiveBombs = 0;
        #1000;
        #1000; Player1DebouncedBtnC = 1; ActiveBombs = 3'b100; #50_000_000; Player1DebouncedBtnC = 0; #1000;
        #1000; Player1DebouncedBtnC = 1; ActiveBombs = 3'b110;#50_000_000; Player1DebouncedBtnC = 0; #1000;
        #1000; Player1DebouncedBtnC = 1; ActiveBombs = 3'b111;#50_000_000; Player1DebouncedBtnC = 0; 
        #1_000_000_000; ActiveBombs = 3'b011; 
        #1000; Player1DebouncedBtnC = 1; ActiveBombs = 3'b111;#50_000_000; Player1DebouncedBtnC = 0; #1000; 
    end
    
    always begin
        #80; clk6p25m = ~clk6p25m; 
    end
    genvar j;
    
    integer k;
    reg next_clock = 0;
    reg init = 1;
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
        else begin
            edge_registered <= 0;
            if(~edge_registered & reassign)
            begin
                
                FreeBomb <= 99;
                                            
                for(k = 0 ; k < Maxbombcount ; k = k+1)
                begin
                    if(ActiveBombs[k] == 0 & (k != FreeBomb))
                    begin
                        FreeBomb <= k;
                        reassign <= 0;
                    end
                end
            end
            next_clock <= 1;
        end
        //maybe last 2 bombs cannot use cause of smt in this logics
        if((~reassign & ~init & next_clock & FreeBomb == 99) | (~reassign & ActiveBombs[FreeBomb] == 1))
        begin
            reassign <= 1;
            next_clock <= 0;
        end
        else if(init)
        begin
            init <= 0;
        end
    end
endmodule