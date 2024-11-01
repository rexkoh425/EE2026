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
    input[6:0] Player1Block , Player2Block,Player3Block,Player4Block,
    input Player1DebouncedBtnC , Player2DebouncedBtnC, Player3DebouncedBtnC, Player4DebouncedBtnC, 
    input[15:0] SW,
    input player1_isReviving, player2_isReviving,player3_isReviving,player4_isReviving,
    input start_game,
    output reg bomb = 1'b0 ,
    output ExplosionAnimations ,
    output player1_die , player2_die ,player3_die,player4_die
);  

    wire[3:0] xBlock;
    wire[2:0] yBlock;
    wire[6:0] BombMinX , BombMaxX;
    wire[5:0] BombMinY , BombMaxY;
    parameter dimension = 9;
    parameter[6:0] Maxbombcount = 3; 
    //seems like got bug with dropping more than n-2 bombs where
    //it will explode where the player is
    //increasing bomb count significantly increase bitstream gen time
    //decrease bomb count for testing purposes
    
    //look to remove this
    reg[25:0] Bombs [0:Maxbombcount-1];
    reg[6:0] BombsBlock [0:Maxbombcount-1];
    wire[6:0] ExplosionRadiusBlocks[0 : Maxbombcount-1][0:7];
    wire[69:0] ExplosionBlocks;
    wire[Maxbombcount-1 :0] bombs;
    wire[Maxbombcount-1 :0] explode;
    wire[Maxbombcount-1 : 0] ActiveBombs;
    wire[Maxbombcount-1 : 0] player1_died;
    wire[Maxbombcount-1 : 0] player2_died;
    wire[Maxbombcount-1 : 0] player3_died;
    wire[Maxbombcount-1 : 0] player4_died;
    wire[Maxbombcount-1 : 0] immediate_explode;
    wire[(Maxbombcount * 2) - 1 : 0] WhichPlayerBomb;
    wire[7:0] FreeBomb;
    wire edge_registered;
    wire[Maxbombcount-1 : 0] ExplosionAnimation;
    reg[69:0] blocksAffectedByExplosion;
    
    assign player1_die = |player1_died;
    assign player2_die = |player2_died;
    assign player3_die = |player3_died;
    assign player4_die = |player4_died;
    
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
        .FreeBomb(FreeBomb) , 
        .Player1DebouncedBtnC(Player1DebouncedBtnC) ,
        .Player2DebouncedBtnC(Player2DebouncedBtnC) ,
        .Player3DebouncedBtnC(Player3DebouncedBtnC) ,
        .Player4DebouncedBtnC(Player4DebouncedBtnC) ,
        .edge_registered(edge_registered),
        .player1_isReviving(player1_isReviving),
        .player2_isReviving(player2_isReviving),
        .player3_isReviving(player3_isReviving),
        .player4_isReviving(player4_isReviving),
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
                .Player1Block(Player1Block), .Player2Block(Player2Block),.Player3Block(Player3Block),.Player4Block(Player4Block), 
                .ExplosionAnimation(ExplosionAnimation[j]),
                .player1_died(player1_died[j]),.player2_died(player2_died[j]),.player3_died(player3_died[j]),.player4_died(player4_died[j]),
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
                .Player1SW(SW[15:13]),
                .active(ActiveBombs[j]),
                .blocksAffectedByExplosion(blocksAffectedByExplosion),
                .immediate_explode(immediate_explode[j])
            );
        end
    endgenerate
    
    reg[6:0] PlayerBlock;
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //assign PlayerBlock = SW[5] ? Player1Block : SW[6] ? Player2Block : SW[7] ? Player3Block : Player4Block;
    always @(posedge clk6p25m) begin
        if (Player1DebouncedBtnC) begin
            PlayerBlock <= Player1Block;
        end else if (Player2DebouncedBtnC) begin
            PlayerBlock <= Player2Block;        
        end else if (Player3DebouncedBtnC) begin
            PlayerBlock <= Player3Block;        
        end else if (Player4DebouncedBtnC) begin
            PlayerBlock <= Player4Block;        
        end
    end
    //assign to different players according to signals
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    assign ExplosionAnimations = |ExplosionAnimation;
    assign xBlock = (PlayerBlock % 10) + 1;
    assign yBlock = (PlayerBlock / 10) + 1;
    assign BombMinX = 3 + (xBlock - 1) * dimension;
    assign BombMaxX = 3 + (xBlock * dimension) - 1;
    assign BombMinY = 1 + (yBlock - 1) * dimension;
    assign BombMaxY = 1 + (yBlock * dimension) - 1;
    
    always @ (posedge clk6p25m)
    begin
        if(FreeBomb != 99)
        begin
            BombsBlock[FreeBomb] <= PlayerBlock;
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
