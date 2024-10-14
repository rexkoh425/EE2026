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
    input clk100mhz , clk6p25m ,
    input[12:0] pixel_index ,
    input btnU , btnD , btnL , btnR , btnC ,
    output reg[6:0] PlayerMinX , PlayerMaxX ,
    output reg[5:0] PlayerMinY , PlayerMaxY ,
    output player ,
    output isCollideLed
);
    
    reg[6:0] FuturePlayerMinX , FuturePlayerMaxX; 
    reg[5:0] FuturePlayerMinY , FuturePlayerMaxY;
    
    initial begin
         PlayerMinX = 4;
         PlayerMaxX = 10;
         PlayerMinY = 2;
         PlayerMaxY = 8;
         FuturePlayerMinX = 4;
         FuturePlayerMaxX = 10; 
         FuturePlayerMinY = 2;
         FuturePlayerMaxY = 8;
    end
    
    reg FutureCheck = 1'b0;
    wire Collide_Immutable;
    
    CollisionCheck Collision(
        .PlayerMinX(FuturePlayerMinX) , .PlayerMaxX(FuturePlayerMaxX) , 
        .PlayerMinY(FuturePlayerMinY) , .PlayerMaxY(FuturePlayerMaxY) ,
        .isCollisionWithImmutable(Collide_Immutable)
    );
    
    Player Player1(
        .pixel_index(pixel_index) ,
        .PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , 
        .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) ,
        .player(player)
    );
    
    wire clk_40hz;
    var_clock clk40hz(.clk(clk100mhz) , .M(32'd1249999) , .SLOW_CLOCK(clk_40hz));
      
    wire isBottomBound = PlayerMaxY > 62;
    assign isCollideLed = (isBottomBound && btnD) | Collide_Immutable;
    
    always @ (posedge clk_40hz)
    begin
        if(btnU)
        begin
            if(FutureCheck)
            begin
                if(~Collide_Immutable)
                begin
                    PlayerMinY <= PlayerMinY - 1;
                    PlayerMaxY <= PlayerMaxY - 1;
                end
                else begin
                    FuturePlayerMinY <= PlayerMinY;
                    FuturePlayerMaxY <= PlayerMaxY;
                end
                FutureCheck <= 0;
            end
            else begin
                FuturePlayerMinY <= FuturePlayerMinY - 1;
                FuturePlayerMaxY <= FuturePlayerMaxY - 1;
                FutureCheck <= 1;
            end
        end
        else if(btnD)
        begin
            if(FutureCheck)
            begin
                if(~Collide_Immutable && ~isBottomBound)
                begin
                    PlayerMinY <= PlayerMinY + 1;
                    PlayerMaxY <= PlayerMaxY + 1;
                end
                else begin
                    FuturePlayerMinY <= PlayerMinY;
                    FuturePlayerMaxY <= PlayerMaxY;
                end
                FutureCheck <= 0;
            end
            else begin
                FuturePlayerMinY <= FuturePlayerMinY + 1;
                FuturePlayerMaxY <= FuturePlayerMaxY + 1;
                FutureCheck <= 1;
            end
        end
        else if(btnL)
        begin
            if(FutureCheck)
            begin
                if(~Collide_Immutable)
                begin
                    PlayerMinX <= PlayerMinX - 1;
                    PlayerMaxX <= PlayerMaxX - 1;
                end
                else begin
                    FuturePlayerMinX <= PlayerMinX;
                    FuturePlayerMaxX <= PlayerMaxX;
                end
                FutureCheck <= 0;
            end
            else begin
                FuturePlayerMinX <= FuturePlayerMinX - 1;
                FuturePlayerMaxX <= FuturePlayerMaxX - 1;
                FutureCheck <= 1;
            end
        end
        else if(btnR)
        begin
            if(FutureCheck)
            begin
                if(~Collide_Immutable)
                begin
                    PlayerMinX <= PlayerMinX + 1;
                    PlayerMaxX <= PlayerMaxX + 1;
                end
                else begin
                    FuturePlayerMinX <= PlayerMinX;
                    FuturePlayerMaxX <= PlayerMaxX;
                end
                FutureCheck <= 0;
            end
            else begin
                FuturePlayerMinX <= FuturePlayerMinX + 1;
                FuturePlayerMaxX <= FuturePlayerMaxX + 1;
                FutureCheck <= 1;
            end
        end
        else if(btnC)
        begin
            
        end
        else
        begin
            FutureCheck <= 0;
            FuturePlayerMinY <= PlayerMinY;
            FuturePlayerMaxY <= PlayerMaxY;
            FuturePlayerMinX <= PlayerMinX;
            FuturePlayerMaxX <= PlayerMaxX;
        end
    end
    
endmodule
