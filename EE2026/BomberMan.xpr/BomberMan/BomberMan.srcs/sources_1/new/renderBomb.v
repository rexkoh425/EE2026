`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2024 11:17:48
// Design Name: 
// Module Name: renderBomb
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


module renderBomb(
    input [6:0] centreX, 
    input [5:0] centreY, 
    input [12:0] pixel_index, 
    input [31:0] bombCount,
    input clock, 
    input [15:0]FreeBomb,
    input [31:0] MyNumber,
    input edge_registered,
    output reg [15:0] pixel_data,
    output reg isBomb
);

   wire [15:0] bombState, redState;
   reg startFlicker = 0;
   wire stopFlicker;
   wire isRed;
   wire isDefBomb;
   wire isRedBomb;
   staticBomb(.centreX(centreX), 
              .centreY(centreY), 
              .pixel_index(pixel_index), .clock(clock), 
              .isBomb(isDefBomb), 
              .pixel_data(bombState)
             );
   redBomb redBomb(.centreX(centreX), 
              .centreY(centreY), 
              .pixel_index(pixel_index), .clock(clock), 
              .isBomb(isRedBomb), 
              .pixel_data(redState)
             );
   flickerBomb flickerBomb(.clock(clock), .start(startFlicker),
               .bombCounter(32'd31250000),
               .isRed(isRed), .stop(stopFlicker)
               );    
   always @ (posedge clock) begin
        if (edge_registered && MyNumber == FreeBomb) begin
            startFlicker <= 1;
        end
        if (isRed) begin
            pixel_data <= redState;
            isBomb <= isRedBomb;
        end else begin
            pixel_data <= bombState;
            isBomb <= isDefBomb;
        end
        if (stopFlicker) begin
            startFlicker = 0;
        end
   end

   
endmodule
