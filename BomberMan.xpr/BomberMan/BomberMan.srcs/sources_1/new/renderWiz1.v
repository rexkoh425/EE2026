`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 09:05:56
// Design Name: 
// Module Name: renderWiz1
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


module renderWiz1(
    input [6:0] centreX, 
    input [5:0] centreY, 
    input [12:0] pixel_index, 
    input clock, 
    output reg [15:0] pixel_data,
    output reg isPixel
);

    integer numPoints = 74;
    integer i;
    reg [6:0] xValueArray[0:74];
    reg [5:0] yValueArray[0:74];
    reg [15:0] colourValueArray[0:74];
    reg [6:0] x_value_check;
    reg [5:0] y_value_check;

    initial begin

        xValueArray[0] = 7'b1111111 + 1 - 5;
        yValueArray[0] = 3;
        colourValueArray[0] = 58803;

        xValueArray[1] = 7'b1111111 + 1 - 3;
        yValueArray[1] = 6'b111111 + 1 - 1;
        colourValueArray[1] = 58803;

        xValueArray[2] = 7'b1111111 + 1 - 2;
        yValueArray[2] = 6'b111111 + 1 - 1;
        colourValueArray[2] = 58803;

        xValueArray[3] = 7'b1111111 + 1 - 5;
        yValueArray[3] = 5;
        colourValueArray[3] = 25076;

        xValueArray[4] = 7'b1111111 + 1 - 4;
        yValueArray[4] = 6'b111111 + 1 - 2;
        colourValueArray[4] = 25076;

        xValueArray[5] = 7'b1111111 + 1 - 4;
        yValueArray[5] = 6'b111111 + 1 - 1;
        colourValueArray[5] = 25076;

        xValueArray[6] = 7'b1111111 + 1 - 4;
        yValueArray[6] = 0;
        colourValueArray[6] = 25076;

        xValueArray[7] = 7'b1111111 + 1 - 4;
        yValueArray[7] = 2;
        colourValueArray[7] = 25076;

        xValueArray[8] = 7'b1111111 + 1 - 4;
        yValueArray[8] = 4;
        colourValueArray[8] = 25076;

        xValueArray[9] = 7'b1111111 + 1 - 4;
        yValueArray[9] = 5;
        colourValueArray[9] = 25076;

        xValueArray[10] = 7'b1111111 + 1 - 3;
        yValueArray[10] = 6'b111111 + 1 - 3;
        colourValueArray[10] = 25076;

        xValueArray[11] = 7'b1111111 + 1 - 3;
        yValueArray[11] = 6'b111111 + 1 - 2;
        colourValueArray[11] = 25076;

        xValueArray[12] = 7'b1111111 + 1 - 3;
        yValueArray[12] = 2;
        colourValueArray[12] = 25076;

        xValueArray[13] = 7'b1111111 + 1 - 3;
        yValueArray[13] = 3;
        colourValueArray[13] = 25076;

        xValueArray[14] = 7'b1111111 + 1 - 3;
        yValueArray[14] = 4;
        colourValueArray[14] = 25076;

        xValueArray[15] = 7'b1111111 + 1 - 2;
        yValueArray[15] = 6'b111111 + 1 - 4;
        colourValueArray[15] = 25076;

        xValueArray[16] = 7'b1111111 + 1 - 2;
        yValueArray[16] = 6'b111111 + 1 - 3;
        colourValueArray[16] = 25076;

        xValueArray[17] = 7'b1111111 + 1 - 2;
        yValueArray[17] = 6'b111111 + 1 - 2;
        colourValueArray[17] = 25076;

        xValueArray[18] = 7'b1111111 + 1 - 2;
        yValueArray[18] = 2;
        colourValueArray[18] = 25076;

        xValueArray[19] = 7'b1111111 + 1 - 2;
        yValueArray[19] = 3;
        colourValueArray[19] = 25076;

        xValueArray[20] = 7'b1111111 + 1 - 3;
        yValueArray[20] = 0;
        colourValueArray[20] = 50745;

        xValueArray[21] = 7'b1111111 + 1 - 3;
        yValueArray[21] = 1;
        colourValueArray[21] = 50745;

        xValueArray[22] = 7'b1111111 + 1 - 2;
        yValueArray[22] = 0;
        colourValueArray[22] = 50745;

        xValueArray[23] = 7'b1111111 + 1 - 2;
        yValueArray[23] = 1;
        colourValueArray[23] = 50745;

        xValueArray[24] = 7'b1111111 + 1 - 1;
        yValueArray[24] = 2;
        colourValueArray[24] = 50745;

        xValueArray[25] = 7'b1111111 + 1 - 1;
        yValueArray[25] = 3;
        colourValueArray[25] = 50745;

        xValueArray[26] = 0;
        yValueArray[26] = 3;
        colourValueArray[26] = 50745;

        xValueArray[27] = 1;
        yValueArray[27] = 2;
        colourValueArray[27] = 50745;

        xValueArray[28] = 7'b1111111 + 1 - 3;
        yValueArray[28] = 5;
        colourValueArray[28] = 29366;

        xValueArray[29] = 7'b1111111 + 1 - 2;
        yValueArray[29] = 4;
        colourValueArray[29] = 29366;

        xValueArray[30] = 7'b1111111 + 1 - 2;
        yValueArray[30] = 5;
        colourValueArray[30] = 29366;

        xValueArray[31] = 7'b1111111 + 1 - 1;
        yValueArray[31] = 6'b111111 + 1 - 4;
        colourValueArray[31] = 29366;

        xValueArray[32] = 7'b1111111 + 1 - 1;
        yValueArray[32] = 6'b111111 + 1 - 3;
        colourValueArray[32] = 29366;

        xValueArray[33] = 7'b1111111 + 1 - 1;
        yValueArray[33] = 6'b111111 + 1 - 2;
        colourValueArray[33] = 29366;

        xValueArray[34] = 7'b1111111 + 1 - 1;
        yValueArray[34] = 4;
        colourValueArray[34] = 29366;

        xValueArray[35] = 7'b1111111 + 1 - 1;
        yValueArray[35] = 5;
        colourValueArray[35] = 29366;

        xValueArray[36] = 0;
        yValueArray[36] = 6'b111111 + 1 - 4;
        colourValueArray[36] = 29366;

        xValueArray[37] = 0;
        yValueArray[37] = 6'b111111 + 1 - 3;
        colourValueArray[37] = 29366;

        xValueArray[38] = 0;
        yValueArray[38] = 6'b111111 + 1 - 2;
        colourValueArray[38] = 29366;

        xValueArray[39] = 0;
        yValueArray[39] = 4;
        colourValueArray[39] = 29366;

        xValueArray[40] = 0;
        yValueArray[40] = 5;
        colourValueArray[40] = 29366;

        xValueArray[41] = 1;
        yValueArray[41] = 6'b111111 + 1 - 3;
        colourValueArray[41] = 29366;

        xValueArray[42] = 1;
        yValueArray[42] = 6'b111111 + 1 - 2;
        colourValueArray[42] = 29366;

        xValueArray[43] = 1;
        yValueArray[43] = 6'b111111 + 1 - 4;
        colourValueArray[43] = 39898;

        xValueArray[44] = 1;
        yValueArray[44] = 3;
        colourValueArray[44] = 39898;

        xValueArray[45] = 1;
        yValueArray[45] = 4;
        colourValueArray[45] = 39898;

        xValueArray[46] = 1;
        yValueArray[46] = 5;
        colourValueArray[46] = 39898;

        xValueArray[47] = 2;
        yValueArray[47] = 6'b111111 + 1 - 3;
        colourValueArray[47] = 39898;

        xValueArray[48] = 2;
        yValueArray[48] = 6'b111111 + 1 - 2;
        colourValueArray[48] = 39898;

        xValueArray[49] = 2;
        yValueArray[49] = 2;
        colourValueArray[49] = 39898;

        xValueArray[50] = 2;
        yValueArray[50] = 3;
        colourValueArray[50] = 39898;

        xValueArray[51] = 3;
        yValueArray[51] = 2;
        colourValueArray[51] = 39898;

        xValueArray[52] = 0;
        yValueArray[52] = 6'b111111 + 1 - 1;
        colourValueArray[52] = 60982;

        xValueArray[53] = 1;
        yValueArray[53] = 6'b111111 + 1 - 1;
        colourValueArray[53] = 60982;

        xValueArray[54] = 4;
        yValueArray[54] = 1;
        colourValueArray[54] = 60982;

        xValueArray[55] = 7'b1111111 + 1 - 1;
        yValueArray[55] = 0;
        colourValueArray[55] = 55002;

        xValueArray[56] = 7'b1111111 + 1 - 1;
        yValueArray[56] = 1;
        colourValueArray[56] = 55002;

        xValueArray[57] = 0;
        yValueArray[57] = 0;
        colourValueArray[57] = 55002;

        xValueArray[58] = 0;
        yValueArray[58] = 1;
        colourValueArray[58] = 55002;

        xValueArray[59] = 0;
        yValueArray[59] = 2;
        colourValueArray[59] = 55002;

        xValueArray[60] = 1;
        yValueArray[60] = 0;
        colourValueArray[60] = 55002;

        xValueArray[61] = 1;
        yValueArray[61] = 1;
        colourValueArray[61] = 55002;

        xValueArray[62] = 2;
        yValueArray[62] = 0;
        colourValueArray[62] = 55002;

        xValueArray[63] = 2;
        yValueArray[63] = 1;
        colourValueArray[63] = 55002;

        xValueArray[64] = 7'b1111111 + 1 - 1;
        yValueArray[64] = 6'b111111 + 1 - 1;
        colourValueArray[64] = 00000;

        xValueArray[65] = 2;
        yValueArray[65] = 6'b111111 + 1 - 1;
        colourValueArray[65] = 00000;

        xValueArray[66] = 4;
        yValueArray[66] = 6'b111111 + 1 - 2;
        colourValueArray[66] = 37476;

        xValueArray[67] = 4;
        yValueArray[67] = 6'b111111 + 1 - 1;
        colourValueArray[67] = 37476;

        xValueArray[68] = 4;
        yValueArray[68] = 0;
        colourValueArray[68] = 37476;

        xValueArray[69] = 4;
        yValueArray[69] = 2;
        colourValueArray[69] = 37476;

        xValueArray[70] = 4;
        yValueArray[70] = 3;
        colourValueArray[70] = 37476;

        xValueArray[71] = 4;
        yValueArray[71] = 4;
        colourValueArray[71] = 37476;

        xValueArray[72] = 4;
        yValueArray[72] = 5;
        colourValueArray[72] = 37476;

        xValueArray[73] = 5;
        yValueArray[73] = 6'b111111 + 1 - 2;
        colourValueArray[73] = 37476;

    end

    always @ (posedge clock) begin
        isPixel <= 0;
        for (i = 0; i < numPoints; i = i + 1) begin
            x_value_check = centreX + xValueArray[i];
             y_value_check = centreY + yValueArray[i];
            if ( (pixel_index / 96 == y_value_check) && (pixel_index % 96 == x_value_check) ) begin 
                pixel_data <= colourValueArray[i];
                isPixel <= 1;
            end
        end
    end
endmodule
