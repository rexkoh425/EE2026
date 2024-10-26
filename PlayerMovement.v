`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 21:24:49
// Design Name: 
// Module Name: PlayerMovement
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


module PlayerMovement(
    input clk100mhz, clk6p25m,
    input [12:0] pixel_index,
    input btnU, btnD, btnL, btnR, DebouncedBtnC,
    input master_rx, reset, masterToggle,
    input [1:0] slave_rx,
    output [1:0] master_tx,
    output slave_tx, 
    output isCollideLed, output[15:0] pixel_data ,
    output reg testLed = 0,
    output led3, player1_isReviving
);
    
    parameter[6:0] InitialMinX1 = 4, InitialMaxX1 = 10, InitialMinY1 = 2, InitialMaxY1 = 8;
    parameter[6:0] InitialMinX2 = 86, InitialMaxX2 = 92, InitialMinY2 = 2, InitialMaxY2 = 8;
    
    reg [6:0] Player1MinX, Player1MaxX;
    reg [5:0] Player1MinY, Player1MaxY;
    reg [6:0] FuturePlayer1MinX, FuturePlayer1MaxX;
    reg [5:0] FuturePlayer1MinY, FuturePlayer1MaxY;

    reg [6:0] Player2MinX, Player2MaxX;
    reg [5:0] Player2MinY, Player2MaxY;
    reg [6:0] FuturePlayer2MinX, FuturePlayer2MaxX;
    reg [5:0] FuturePlayer2MinY, FuturePlayer2MaxY;
    
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
   wire CenterBlock , walls, player1, player2;
   ConcreteBlocks ConcreteBlock(
       .pixel_index(pixel_index) ,
       .walls(walls) , .CenterBlock(CenterBlock)
   );
        
   wire[6:0] PlayerBlock1, PlayerBlock2; 
   SquareTracker TrackUserSquare1(
        .clk6p25m(clk6p25m),
        .PlayerMinX(Player1MinX) , .PlayerMaxX(Player1MaxX) , 
        .PlayerMinY(Player1MinY) , .PlayerMaxY(Player1MaxY) ,
        .Player1Block(PlayerBlock1)
    );
        
    SquareTracker TrackUserSquare2(
        .clk6p25m(clk6p25m),
        .PlayerMinX(Player2MinX) , .PlayerMaxX(Player2MaxX) , 
        .PlayerMinY(Player2MinY) , .PlayerMaxY(Player2MaxY) ,
        .Player1Block(PlayerBlock2)
    );
        
    wire bomb1, bomb2;
    wire ExplosionAnimations, ExplosionAnimations2;
    wire player1_die, player2_die, player2_isReviving;
    reg BtnCPlayer1, BtnCPlayer2;
    Bomb unitBomb1(
        .clk6p25m(clk6p25m),
        .pixel_index(pixel_index) ,
        .Player1Block(PlayerBlock1) ,
        .bomb(bomb1),
        .DebouncedBtnC(BtnCPlayer1),
        .ExplosionAnimations(ExplosionAnimations),
        .player1_die(player1_die) ,
        .player1_isReviving(player1_isReviving)
    );
        
    Bomb unitBomb2(
        .clk6p25m(clk6p25m),
        .pixel_index(pixel_index) ,
        .Player1Block(PlayerBlock2) ,
        .bomb(bomb2),
        .DebouncedBtnC(BtnCPlayer2),
        .ExplosionAnimations(ExplosionAnimations2),
        .player1_die(player2_die) ,
        .player1_isReviving(player2_isReviving)
    );
        
    PixelDataControl ColourControl1(
        .clk6p25m(clk6p25m) , .player1_die(player1_die), .player2_die(player2_die),
        .walls(walls) , .CenterBlock(CenterBlock), .player1(player1) , .player2(player2), 
        .ExplosionAnimations(ExplosionAnimations), .ExplosionAnimations2(ExplosionAnimations2),
        .player1_isReviving(player1_isReviving), .player2_isReviving(player2_isReviving),
        .bomb1(bomb1) , .bomb2(bomb2), .pixel_data(pixel_data)
    );
        
    
/////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////    
//UART Start
    wire start;


    slave_tx slave_tx_module(
        .clk(clk100mhz), .reset(reset),
        .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .DebouncedBtnC(DebouncedBtnC),
        .tx(slave_tx), .start(start)
    );

    wire [31:0] rx_data_master;
    reg valid_master_flag;
    wire valid_master;
    
    uart_rx_new master_rx_module(
        .clk(clk100mhz), .reset(reset), .rx(master_rx), 
        .data(rx_data_master), .valid(valid_master)
    );

    master_tx master_tx_module1(
        .clk(clk100mhz), .reset(reset),
        .player_min_x(Player1MinX), .player_max_x(Player1MaxX),
        .player_min_y(Player1MinY), .player_max_y(Player1MaxY),
        .tx(master_tx[1]), .BtnCPlayer(BtnCPlayer1)
    );
    
    master_tx master_tx_module2(
        .clk(clk100mhz), .reset(reset),
        .player_min_x(Player2MinX), .player_max_x(Player2MaxX),
        .player_min_y(Player2MinY), .player_max_y(Player2MaxY),
        .tx(master_tx[0]), .BtnCPlayer(BtnCPlayer2)
    );
      
    wire [31:0] rx_data_slave;
    reg valid_slave_flag;
    wire valid_slave;
    
    uart_rx_new slave_rx_module(
        .clk(clk100mhz), .reset(reset),
        .rx(slave_rx[0]), .data(rx_data_slave), .valid(valid_slave)
    );
    
    wire [31:0] rx_data_slave2;
    reg valid_slave_flag2;
    wire valid_slave2;
    
    uart_rx_new slave_rx_module2(
        .clk(clk100mhz), .reset(reset),
        .rx(slave_rx[1]), .data(rx_data_slave2), .valid(valid_slave2)
    );
    
        
    initial begin
        Player1MinX = InitialMinX1;
        Player1MaxX = InitialMaxX1;
        Player1MinY = InitialMinY1;
        Player1MaxY = InitialMaxY1;
        Player1MaxY = InitialMaxY1;
        FuturePlayer1MinX = Player1MinX;
        FuturePlayer1MaxX = Player1MaxX;
        FuturePlayer1MinY = Player1MinY;
        FuturePlayer1MaxY = Player1MaxY;
        
        Player2MinX = InitialMinX2;
        Player2MaxX = InitialMaxX2;
        Player2MinY = InitialMinY2;
        Player2MaxY = InitialMaxY2;
        Player2MaxY = InitialMaxY2;
        FuturePlayer2MinX = Player2MinX;
        FuturePlayer2MaxX = Player2MaxX;
        FuturePlayer2MinY = Player2MinY;
        FuturePlayer2MaxY = Player2MaxY;
    end
    
    reg FutureCheck = 1'b0;
    wire Collide_Immutable, Collide_Immutable2;

    CollisionCheck Collision(
        .PlayerMinX(FuturePlayer1MinX), .PlayerMaxX(FuturePlayer1MaxX),
        .PlayerMinY(FuturePlayer1MinY), .PlayerMaxY(FuturePlayer1MaxY),
        .isCollisionWithImmutable(Collide_Immutable)
    );
    
    CollisionCheck Collision2(
        .PlayerMinX(FuturePlayer2MinX), .PlayerMaxX(FuturePlayer2MaxX),
        .PlayerMinY(FuturePlayer2MinY), .PlayerMaxY(FuturePlayer2MaxY),
        .isCollisionWithImmutable(Collide_Immutable2)
    );
    Player Player1(
        .pixel_index(pixel_index),
        .PlayerMinX(Player1MinX), .PlayerMaxX(Player1MaxX),
        .PlayerMinY(Player1MinY), .PlayerMaxY(Player1MaxY),
        .player(player1)
    );
    
    Player Player2(
        .pixel_index(pixel_index),
        .PlayerMinX(Player2MinX), .PlayerMaxX(Player2MaxX),
        .PlayerMinY(Player2MinY), .PlayerMaxY(Player2MaxY),
        .player(player2)
    );
    
    wire clk_40hz;
    var_clock clk40hz(.clk(clk100mhz), .M(32'd1249999), .SLOW_CLOCK(clk_40hz));

    wire isBottomBound = Player1MaxY > 62;
    wire isBottomBound2 = Player2MaxY > 62;
    assign isCollideLed = (isBottomBound && btnD) | Collide_Immutable;
    reg[2:0] button = 0;
    
    always @(posedge clk_40hz) begin
        if (masterToggle == 1) begin
                case (rx_data_master[7:0])
                    8'h01: begin // Move Up   
                        testLed <= 0;               
                        FuturePlayer2MinY = Player2MinY - 1;
                        FuturePlayer2MaxY = Player2MaxY - 1;
                        if (~Collide_Immutable2) begin
                            Player2MinY = FuturePlayer2MinY;
                            Player2MaxY = FuturePlayer2MaxY;
                        end
                        BtnCPlayer2 <= 0;                          
                    end
                    8'h02: begin // Move Down    
                        testLed <= 0;             
                        FuturePlayer2MinY = Player2MinY + 1;
                        FuturePlayer2MaxY = Player2MaxY + 1;
                        if (~Collide_Immutable2 && ~isBottomBound2) begin
                            Player2MinY = FuturePlayer2MinY;
                            Player2MaxY = FuturePlayer2MaxY;
                        end
                        BtnCPlayer2 <= 0;                          
                    end
                    8'h03: begin // Move Left
                        testLed <= 0;
                        FuturePlayer2MinX = Player2MinX - 1;
                        FuturePlayer2MaxX = Player2MaxX - 1;
                        if (~Collide_Immutable2) begin
                            Player2MinX = FuturePlayer2MinX;
                            Player2MaxX = FuturePlayer2MaxX;
                        end
                        BtnCPlayer2 <= 0;                         
                    end
                    8'h04: begin // Move Right
                        testLed <= 0;
                        FuturePlayer2MinX = Player2MinX + 1;
                        FuturePlayer2MaxX = Player2MaxX + 1;
                        if (~Collide_Immutable2) begin
                            Player2MinX = FuturePlayer2MinX;
                            Player2MaxX = FuturePlayer2MaxX;
                        end
                        BtnCPlayer2 <= 0;                       
                    end
                    8'h05: begin
                        BtnCPlayer2 <= 1;
                    end
                    default: begin
                        testLed <= 1;
                        BtnCPlayer2 <= 0;                          
                    end
                endcase
                
                if (btnU) begin
                    FuturePlayer1MinY = Player1MinY - 1;
                    FuturePlayer1MaxY = Player1MaxY - 1;
                    if (~Collide_Immutable) begin
                        Player1MinY = FuturePlayer1MinY;
                        Player1MaxY = FuturePlayer1MaxY;
                    end
                    BtnCPlayer1 <= 0;                    
                end
                else if (btnD) begin;
                    FuturePlayer1MinY = Player1MinY + 1;
                    FuturePlayer1MaxY = Player1MaxY + 1;
                    if (~Collide_Immutable && ~isBottomBound) begin
                        Player1MinY = FuturePlayer1MinY;
                        Player1MaxY = FuturePlayer1MaxY;
                    end
                    BtnCPlayer1 <= 0;                  
                end
                else if (btnL) begin
                    FuturePlayer1MinX = Player1MinX - 1;
                    FuturePlayer1MaxX = Player1MaxX - 1;
                    if (~Collide_Immutable) begin
                        Player1MinX = FuturePlayer1MinX;
                        Player1MaxX = FuturePlayer1MaxX;
                    end  
                    BtnCPlayer1 <= 0;                                        
                end
                else if (btnR) begin
                    FuturePlayer1MinX = Player1MinX + 1;
                    FuturePlayer1MaxX = Player1MaxX + 1;
                    if (~Collide_Immutable) begin
                        Player1MinX = FuturePlayer1MinX;
                        Player1MaxX = FuturePlayer1MaxX;
                    end   
                     BtnCPlayer1 <= 0;                                      
                end
                else if (DebouncedBtnC) begin
                    BtnCPlayer1 <= 1;
                end
                else begin
                    BtnCPlayer1 <= 0;                     
                end                         
            end
            else begin
            // Update position from slave data
            testLed <= 1;
            Player1MinX <= rx_data_slave[31:25];
            Player1MaxX <= rx_data_slave[24:18];
            Player1MinY <= rx_data_slave[17:12];
            Player1MaxY <= rx_data_slave[11:6];
            BtnCPlayer1 <= rx_data_slave[5];
            Player2MinX <= rx_data_slave2[31:25];
            Player2MaxX <= rx_data_slave2[24:18];
            Player2MinY <= rx_data_slave2[17:12];
            Player2MaxY <= rx_data_slave2[11:6];
            BtnCPlayer2 <= rx_data_slave2[5];  
        end
    end
    
    
    /*if(player1_isReviving)
    begin
        FutureCheck <= 0;
        Player1MinX <= InitialMinX1;
        Player1MaxX <= InitialMaxX1;
        Player1MinY <= InitialMinY1;
        Player1MaxY <= InitialMaxY1;
        FuturePlayer1MinX <= InitialMinX1;
        FuturePlayer1MaxX <= InitialMaxX1;
        FuturePlayer1MinY <= InitialMinY1;
        FuturePlayer1MaxY <= InitialMaxY1;
        button <= 5;
    end*/
endmodule
