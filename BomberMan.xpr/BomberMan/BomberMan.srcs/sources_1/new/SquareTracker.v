`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:38:45
// Design Name: 
// Module Name: SquareTracker
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


module SquareTracker 
#(
    parameter dimensions = 9 , 
    parameter minX = 3 ,maxX = 93 ,
    parameter minY = 1 , maxY = 64
)(
    input clk6p25m ,
    input [6:0] PlayerMinX , PlayerMaxX , 
    input [5:0] PlayerMinY , PlayerMaxY ,
    output reg[6:0] Player1Block
);

    localparam num_x_blocks = (maxX - minX) / dimensions; 
    localparam num_y_blocks = (maxY - minY) / dimensions;
        
    genvar x , y;
    wire[((maxY - minY)/dimensions) * ((maxX - minX)/dimensions) - 1 : 0]  blocks;
    wire TopWall , LeftWall , RightWall , BottomWall;
    generate
        for (x = minX; x < maxX; x = x + dimensions) begin : outer_loop
            for (y = minY ; y < maxY; y = y + dimensions) begin : mod_inst
                WithinXY Block(
                    .PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , 
                    .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , 
                    .min_x(x) , .max_x(x+dimensions-1) , 
                    .min_y(y) , .max_y(y+dimensions-1) , 
                    .collided(blocks[(num_x_blocks * ((y - minY)/dimensions)) + (((x - minX)/dimensions))])
                );
            end
        end
    endgenerate
    
    integer i;
    reg [3:0] xBlock;
    reg [2:0] yBlock;
    reg [6:0] min_x;
    reg [5:0] min_y;
    reg[6:0] FirstBlock , SecondBlock;
    reg BlocksSet = 0;
    initial begin
        FirstBlock = 7'b0; 
        SecondBlock = 7'b0;
    end
    
    always @ (posedge clk6p25m)
    begin
      
        if(!BlocksSet)
        begin
            for (i = 0; i < 70; i = i + 1) 
            begin
                if(blocks[i])
                begin
                    if(FirstBlock == 7'b0)
                    begin
                        FirstBlock <= i;
                    end
                    else
                    begin
                        SecondBlock <= i;
                    end
                end
            end
            BlocksSet <= 1;
        end
        else begin
            FirstBlock <= 0;
            SecondBlock <= 0;
            
            if(SecondBlock == 7'b0)
            begin
                Player1Block <= FirstBlock;
            end
            else if((SecondBlock - FirstBlock) == 1)
            begin
                xBlock <= (FirstBlock % 10) + 1;
                min_x <= 3 + (xBlock - 1) * 9 ;
                if(PlayerMinX - min_x > 5)
                begin
                    Player1Block <= SecondBlock;
                end
                else
                begin
                    Player1Block <= FirstBlock;
                end
            end
            else
            begin
                yBlock <= (FirstBlock / 10) + 1;
                min_y <= 3 + (yBlock - 1) * 9 ;
                if(PlayerMinY - min_y > 5)
                begin
                    Player1Block <= SecondBlock;
                end
                else
                begin
                    Player1Block <= FirstBlock;
                end
            end
            BlocksSet <= 0;
        end
    end
endmodule
