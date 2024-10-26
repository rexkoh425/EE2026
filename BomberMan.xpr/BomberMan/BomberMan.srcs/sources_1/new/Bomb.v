`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:24:55
// Design Name: 
// Module Name: Bomb
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


module Bomb(
    input clk6p25m,
    input[12:0] pixel_index ,
    input[6:0] Player1Block ,
    input Player1DebouncedBtnC ,
    input[15:0] Player1SW,
    input player1_isReviving,
    input start_game,
    output reg bomb = 1'b0 ,
    output ExplosionAnimations ,
    output player1_die
);  

    wire[3:0] xBlock;
    wire[2:0] yBlock;
    wire[6:0] BombMinX , BombMaxX;
    wire[5:0] BombMinY , BombMaxY;
    parameter dimension = 9;
    parameter[6:0] Maxbombcount = 4; 
    //seems like got bug with dropping more than n-2 bombs where
    //it will explode where the player is
    //increasing bomb count significantly increase bitstream gen time
    //decrease bomb count for testing purposes
    
    reg[25:0] Bombs [0:Maxbombcount-1];
    reg[6:0] BombsBlock [0:Maxbombcount-1];
    wire[6:0] ExplosionRadiusBlocks[0 : Maxbombcount-1][0:7];
    wire[69:0] ExplosionBlocks;
    wire[Maxbombcount-1 :0] bombs;
    wire[Maxbombcount-1 :0] explode;
    wire[Maxbombcount-1 : 0] ActiveBombs;
    wire[Maxbombcount-1 : 0] player1_died;
    wire[Maxbombcount-1 : 0] immediate_explode;
    wire[(Maxbombcount * 2) - 1 : 0] WhichPlayerBomb;
    wire[7:0] FreeBomb;
    wire edge_registered;
    wire[Maxbombcount-1 : 0] ExplosionAnimation;
    reg[69:0] blocksAffectedByExplosion;
    
    assign player1_die = |player1_died;
    integer k;
   
    initial begin
        for(k =0 ; k < Maxbombcount ; k = k+1)
        begin
            Bombs[k] = 26'b0;
            BombsBlock[k] = 7'b0;
        end
    end
    
    FreeBomb #(Maxbombcount)FindFreeBomb(
        .clk6p25m(clk6p25m) , 
        .ActiveBombs(ActiveBombs) ,
        .FreeBomb(FreeBomb) , .Player1DebouncedBtnC(Player1DebouncedBtnC) , 
        .edge_registered(edge_registered),
        .player1_isReviving(player1_isReviving),
        .start_game(start_game),
        .WhichPlayerBomb(WhichPlayerBomb)
    );
    
    genvar j;
    
    generate
        for(j = 0 ; j < Maxbombcount ; j = j+1)
        begin : mod_inst
            isColourPixel BombDrop(
                .min_x(Bombs[j][25:19]) , .max_x(Bombs[j][18:12]) , 
                .min_y(Bombs[j][11:6]) , .max_y(Bombs[j][5:0]) , 
                .pixel_index(pixel_index) , .isColouredPixel(bombs[j])
            );
        end
    endgenerate
    
    generate
        for(j = 0 ; j < Maxbombcount ; j = j+1)
        begin : mod_inst1
            BombCounter Bombcounter(
                .immediate_explode(immediate_explode[j]),
                .clk6p25m(clk6p25m) , 
                .active(ActiveBombs[j]) , .FreeBomb(FreeBomb) , 
                .MyNumber(j) ,
                .edge_registered(edge_registered)
            );
        end
    endgenerate
    
    generate
        for(j = 0 ; j < Maxbombcount ; j = j+1)
        begin : mod_inst2
            ExplodeBomb ExplodeAnimation(
                .clk6p25m(clk6p25m), 
                .pixel_index(pixel_index),
                .BombBlock(BombsBlock[j]),    
                .active(ActiveBombs[j]),   
                .Player1Block(Player1Block),     
                .ExplosionAnimation(ExplosionAnimation[j]),
                .player1_died(player1_died[j]),
                .Up1(ExplosionRadiusBlocks[j][0]) , .Up2(ExplosionRadiusBlocks[j][1]),
                .Left1(ExplosionRadiusBlocks[j][2]) , .Left2(ExplosionRadiusBlocks[j][3]),
                .Right1(ExplosionRadiusBlocks[j][4]) , .Right2(ExplosionRadiusBlocks[j][5]),
                .Down1(ExplosionRadiusBlocks[j][6]) , .Down2(ExplosionRadiusBlocks[j][7]),
                .explode(explode[j])
            );
        end
    endgenerate
    
    generate
        for(j = 0 ; j < Maxbombcount ; j = j+1)
        begin : mod_inst3
            TriggerExplosion #(Maxbombcount) TriggerForBlockJ(
                .BombBlock(BombsBlock[j]) ,
                .WhichPlayerBomb(WhichPlayerBomb[j*2 +1 : j*2]),
                .Player1SW(Player1SW[15:13]),
                .active(ActiveBombs[j]),
                .blocksAffectedByExplosion(blocksAffectedByExplosion),
                .immediate_explode(immediate_explode[j])
            );
        end
    endgenerate
    
    assign ExplosionAnimations = |ExplosionAnimation;
    assign xBlock = (Player1Block % 10) + 1;
    assign yBlock = (Player1Block / 10) + 1;
    assign BombMinX = 3 + (xBlock - 1) * dimension;
    assign BombMaxX = 3 + (xBlock * dimension) - 1;
    assign BombMinY = 1 + (yBlock - 1) * dimension;
    assign BombMaxY = 1 + (yBlock * dimension) - 1;
    
    always @ (posedge clk6p25m)
    begin
        if(FreeBomb != 99)
        begin
            BombsBlock[FreeBomb] <= Player1Block;
            Bombs[FreeBomb][25:19] <= BombMinX;
            Bombs[FreeBomb][18:12] <= BombMaxX;
            Bombs[FreeBomb][11:6] <= BombMinY;
            Bombs[FreeBomb][5:0] <= BombMaxY;
        end
        
        bomb <= 1'b0; 
        for(k = 0 ; k < Maxbombcount ; k = k+1)
        begin
            if(bombs[k] == 1'b1 && ActiveBombs[k] == 1'b1)
            begin
                bomb <= 1'b1;
            end
        end
    end
  
    //should be ok since cneter is not recognised?
    integer x,y;
    always @ (posedge clk6p25m)
    begin
        blocksAffectedByExplosion <= 70'b0;
        for(x = 0 ; x < Maxbombcount ; x = x+1)
        begin
            if(explode[x] == 1'b1)
            begin
                for(y = 0 ; y < 8 ; y = y + 1)
                begin
                    if((ExplosionRadiusBlocks[x][y]) < 70)
                    begin
                       blocksAffectedByExplosion[ExplosionRadiusBlocks[x][y]] <= 1'b1;
                    end
                end
            end
        end
    end
endmodule
