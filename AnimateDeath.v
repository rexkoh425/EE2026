`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 22:34:01
// Design Name: 
// Module Name: AnimateDeath
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


module AnimateDeath(
    input clk6p25m,PlayerBlinkClk,
    input player,
    input player_die,
    output player_status,
    output reg isReviving = 0
);
   
    wire reached;
    Counter_100MHZ counter(.clk(clk6p25m) , .start(isReviving) , .threshold(32'd31_250_000) , .reached(reached));
       
       always @(posedge clk6p25m)
       begin
           if(player_die & ~isReviving)
           begin
               isReviving <= 1;
           end
           if(reached == 1)
               isReviving <= 0;
       end
       
       
       assign player_status = isReviving ? (PlayerBlinkClk & player) : player;
endmodule
