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

        parameter Maxbombcount = 5;
        wire [Maxbombcount-1 : 0]ActiveBombs;
        wire[15:0] FreeBomb;
        wire edge_registered;
        reg DebouncedBtnC;
        reg clk6p25m;
        FreeBomb #(Maxbombcount) FindFreeBomb(.clk6p25m(clk6p25m) , .ActiveBombs(ActiveBombs) , .FreeBomb(FreeBomb) , .DebouncedBtnC(DebouncedBtnC) , .edge_registered(edge_registered));
        
        genvar j;
        generate
            for(j = 0 ; j < Maxbombcount ; j = j+1)
            begin : mod_inst1
                BombCounter Bombcounter(.clk6p25m(clk6p25m) , .active(ActiveBombs[j]) , .FreeBomb(FreeBomb) , .MyNumber(j) , .edge_registered(edge_registered));
            end
        endgenerate
            
        initial begin
            clk6p25m = 0;
            DebouncedBtnC = 0; #1000;
            DebouncedBtnC = 1; #1000;
            DebouncedBtnC = 0; #1000;
            DebouncedBtnC = 1; #1000;
            DebouncedBtnC = 0; #1000;
            DebouncedBtnC = 1; #1000;
            DebouncedBtnC = 0; #1000;
            DebouncedBtnC = 1; #1000;
            DebouncedBtnC = 0; #1000;
            DebouncedBtnC = 1; #1000;
            DebouncedBtnC = 0; #1000;     
        end
        
        always begin
            clk6p25m = ~clk6p25m; #80;
        end
endmodule