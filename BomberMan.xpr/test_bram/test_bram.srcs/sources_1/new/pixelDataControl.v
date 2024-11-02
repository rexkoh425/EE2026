`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:58:24
// Design Name: 
// Module Name: pixelDataControl
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


module pixelDataControl(
    input [12:0] pixel_index,
    input clk,
    output reg [15:0] pixel_data
    );
    
    wire [15:0] item_data, explo_data;
    wire isItem, isExp;
    
//    renderItem(
//        .centreX(10), 
//        .centreY(10), 
//        .pixel_index(pixel_index), 
//        .clock(clk), 
//        .pixel_data(item_data),
//        .isPixel(isItem)
//    );
    
    renderExplosion(
            .centreX(10), 
            .centreY(10), 
            .pixel_index(pixel_index), 
            .clock(clk), 
            .pixel_data(explo_data),
            .isPixel(isExp)
        );
    
    always @ (posedge clk) begin
        if (isExp) begin
            pixel_data <= explo_data;
        end else pixel_data <= 16'h0000;
    end
    
endmodule
