`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:29:03
// Design Name: 
// Module Name: renderItem
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


module renderItem(
    input [6:0] centreX, 
    input [5:0] centreY, 
    input [12:0] pixel_index, 
    input clock, 
    output reg [15:0] pixel_data,
    output reg isPixel
);

    wire [6:0] originX;
    wire [5:0] originY;
    assign originX = centreX - 2;
    assign originY = centreY - 2;
    
    wire [6:0] xCoord;
    wire [5:0] yCoord;
    assign xCoord = pixel_index % 96 - originX;
    assign yCoord = pixel_index / 96 - originY;
    
    (* ram_style = "block" *) reg [15:0] ram [0:9];
    
    initial begin
        ram[0] = 16'hFFFF;
        ram[1] = 16'hFFFF;
        ram[2] = 16'hFFFF;
        ram[3] = 16'hFFFF;
        ram[4] = 16'hFFFF;
        ram[5] = 16'hFFFF;
        ram[6] = 16'hFFFF;
        ram[7] = 16'hFFFF;
        ram[8] = 16'hFFFF;
        ram[9] = 16'hFFFF;
    end
    
    always @ (posedge clock) begin
        isPixel <= 1;
        case({xCoord, yCoord})
            13'b0000001000000: pixel_data <= ram[0];
            13'b0000011000000: pixel_data <= ram[2];
            13'b0000000000001: pixel_data <= ram[3];
            13'b0000010000001: pixel_data <= ram[4];
            13'b0000100000001: pixel_data <= ram[5];
            13'b0000000000010: pixel_data <= ram[6];
            13'b0000100000010: pixel_data <= ram[7];
            13'b0000001000011: pixel_data <= ram[8];
            13'b0000011000011: pixel_data <= ram[9];
            13'b0000010000100: pixel_data <= ram[1];
            default: isPixel <= 0;
        endcase
    end

endmodule
