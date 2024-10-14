`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 23:26:08
// Design Name: 
// Module Name: PixelDataControl
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


module PixelDataControl(
    input clk6p25m , 
    input CenterBlock , walls , player , bomb ,
    output reg[15:0] pixel_data = 16'b0
);
   wire[15:0] WHITE = 16'hFFFF;
   wire[15:0] BLUE = 16'h001F;
   wire[15:0] GREEN = 16'h07E0;
   wire[15:0] RED = 16'hF800;
   wire[15:0] BLACK = 16'h0000;
   wire[15:0] DARK_GREY = 16'h1042;
   wire[15:0] BROWN = 16'hA52A;
   
    always @(posedge clk6p25m)
   begin
       if(CenterBlock)
       begin
           pixel_data <= DARK_GREY;
       end
       else if(walls)
           pixel_data <= BROWN;
       else if(player)
           pixel_data <= GREEN;
       else if(bomb)
           pixel_data <= RED;
       else
           pixel_data <= BLACK;
           
   end
endmodule
