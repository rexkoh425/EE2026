`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 23:39:38
// Design Name: 
// Module Name: renderExplosion
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


module renderExplosion(
    input [6:0] centreX, 
    input [5:0] centreY, 
    input [12:0] pixel_index, 
    input clock, 
    output reg [15:0] pixel_data,
    output reg isPixel
);

    integer numPoints = 69;
    integer i;
    reg [6:0] xValueArray[0:69];
    reg [5:0] yValueArray[0:69];
    reg [15:0] colourValueArray[0:69];
    reg [6:0] x_value_check;
    reg [5:0] y_value_check;

    initial begin

        xValueArray[0] = 7'b1111111 + 1 - 2;
        yValueArray[0] = 6'b111111 + 1 - 2;
        colourValueArray[0] = 65524;

        xValueArray[1] = 7'b1111111 + 1 - 2;
        yValueArray[1] = 6'b111111 + 1 - 1;
        colourValueArray[1] = 65524;

        xValueArray[2] = 7'b1111111 + 1 - 2;
        yValueArray[2] = 1;
        colourValueArray[2] = 65524;

        xValueArray[3] = 7'b1111111 + 1 - 2;
        yValueArray[3] = 3;
        colourValueArray[3] = 65524;

        xValueArray[4] = 7'b1111111 + 1 - 1;
        yValueArray[4] = 2;
        colourValueArray[4] = 65524;

        xValueArray[5] = 0;
        yValueArray[5] = 6'b111111 + 1 - 3;
        colourValueArray[5] = 65524;

        xValueArray[6] = 0;
        yValueArray[6] = 3;
        colourValueArray[6] = 65524;

        xValueArray[7] = 1;
        yValueArray[7] = 6'b111111 + 1 - 2;
        colourValueArray[7] = 65524;

        xValueArray[8] = 2;
        yValueArray[8] = 6'b111111 + 1 - 3;
        colourValueArray[8] = 65524;

        xValueArray[9] = 2;
        yValueArray[9] = 6'b111111 + 1 - 1;
        colourValueArray[9] = 65524;

        xValueArray[10] = 2;
        yValueArray[10] = 2;
        colourValueArray[10] = 65524;

        xValueArray[11] = 2;
        yValueArray[11] = 1;
        colourValueArray[11] = 65524;

        xValueArray[12] = 7'b1111111 + 1 - 3;
        yValueArray[12] = 6'b111111 + 1 - 1;
        colourValueArray[12] = 65249;

        xValueArray[13] = 7'b1111111 + 1 - 3;
        yValueArray[13] = 1;
        colourValueArray[13] = 65249;

        xValueArray[14] = 7'b1111111 + 1 - 2;
        yValueArray[14] = 2;
        colourValueArray[14] = 65249;

        xValueArray[15] = 7'b1111111 + 1 - 1;
        yValueArray[15] = 6'b111111 + 1 - 4;
        colourValueArray[15] = 65249;

        xValueArray[16] = 7'b1111111 + 1 - 1;
        yValueArray[16] = 6'b111111 + 1 - 3;
        colourValueArray[16] = 65249;

        xValueArray[17] = 7'b1111111 + 1 - 1;
        yValueArray[17] = 3;
        colourValueArray[17] = 65249;

        xValueArray[18] = 1;
        yValueArray[18] = 6'b111111 + 1 - 3;
        colourValueArray[18] = 65249;

        xValueArray[19] = 1;
        yValueArray[19] = 3;
        colourValueArray[19] = 65249;

        xValueArray[20] = 2;
        yValueArray[20] = 6'b111111 + 1 - 2;
        colourValueArray[20] = 65249;

        xValueArray[21] = 3;
        yValueArray[21] = 6'b111111 + 1 - 1;
        colourValueArray[21] = 65249;

        xValueArray[22] = 3;
        yValueArray[22] = 1;
        colourValueArray[22] = 65249;

        xValueArray[23] = 3;
        yValueArray[23] = 2;
        colourValueArray[23] = 65249;

        xValueArray[24] = 7'b1111111 + 1 - 4;
        yValueArray[24] = 6'b111111 + 1 - 1;
        colourValueArray[24] = 64578;

        xValueArray[25] = 7'b1111111 + 1 - 4;
        yValueArray[25] = 1;
        colourValueArray[25] = 64578;

        xValueArray[26] = 7'b1111111 + 1 - 3;
        yValueArray[26] = 6'b111111 + 1 - 2;
        colourValueArray[26] = 64578;

        xValueArray[27] = 7'b1111111 + 1 - 1;
        yValueArray[27] = 6'b111111 + 1 - 2;
        colourValueArray[27] = 64578;

        xValueArray[28] = 0;
        yValueArray[28] = 6'b111111 + 1 - 4;
        colourValueArray[28] = 64578;

        xValueArray[29] = 7'b1111111 + 1 - 1;
        yValueArray[29] = 4;
        colourValueArray[29] = 64578;

        xValueArray[30] = 2;
        yValueArray[30] = 6'b111111 + 1 - 4;
        colourValueArray[30] = 64578;

        xValueArray[31] = 3;
        yValueArray[31] = 6'b111111 + 1 - 3;
        colourValueArray[31] = 64578;

        xValueArray[32] = 4;
        yValueArray[32] = 6'b111111 + 1 - 1;
        colourValueArray[32] = 64578;

        xValueArray[33] = 4;
        yValueArray[33] = 1;
        colourValueArray[33] = 64578;

        xValueArray[34] = 7'b1111111 + 1 - 4;
        yValueArray[34] = 6'b111111 + 1 - 2;
        colourValueArray[34] = 64578;

        xValueArray[35] = 1;
        yValueArray[35] = 2;
        colourValueArray[35] = 64578;

        xValueArray[36] = 7'b1111111 + 1 - 3;
        yValueArray[36] = 0;
        colourValueArray[36] = 64578;

        xValueArray[37] = 7'b1111111 + 1 - 4;
        yValueArray[37] = 0;
        colourValueArray[37] = 62051;

        xValueArray[38] = 7'b1111111 + 1 - 3;
        yValueArray[38] = 6'b111111 + 1 - 3;
        colourValueArray[38] = 62051;

        xValueArray[39] = 7'b1111111 + 1 - 3;
        yValueArray[39] = 3;
        colourValueArray[39] = 62051;

        xValueArray[40] = 7'b1111111 + 1 - 2;
        yValueArray[40] = 6'b111111 + 1 - 4;
        colourValueArray[40] = 62051;

        xValueArray[41] = 7'b1111111 + 1 - 2;
        yValueArray[41] = 4;
        colourValueArray[41] = 62051;

        xValueArray[42] = 0;
        yValueArray[42] = 4;
        colourValueArray[42] = 62051;

        xValueArray[43] = 2;
        yValueArray[43] = 4;
        colourValueArray[43] = 62051;

        xValueArray[44] = 3;
        yValueArray[44] = 3;
        colourValueArray[44] = 62051;

        xValueArray[45] = 4;
        yValueArray[45] = 0;
        colourValueArray[45] = 62051;

        xValueArray[46] = 7'b1111111 + 1 - 4;
        yValueArray[46] = 2;
        colourValueArray[46] = 53733;

        xValueArray[47] = 7'b1111111 + 1 - 3;
        yValueArray[47] = 2;
        colourValueArray[47] = 53733;

        xValueArray[48] = 7'b1111111 + 1 - 2;
        yValueArray[48] = 6'b111111 + 1 - 3;
        colourValueArray[48] = 53733;

        xValueArray[49] = 1;
        yValueArray[49] = 6'b111111 + 1 - 4;
        colourValueArray[49] = 53733;

        xValueArray[50] = 1;
        yValueArray[50] = 4;
        colourValueArray[50] = 53733;

        xValueArray[51] = 2;
        yValueArray[51] = 3;
        colourValueArray[51] = 53733;

        xValueArray[52] = 3;
        yValueArray[52] = 6'b111111 + 1 - 2;
        colourValueArray[52] = 53733;

        xValueArray[53] = 3;
        yValueArray[53] = 0;
        colourValueArray[53] = 53733;

        xValueArray[54] = 4;
        yValueArray[54] = 6'b111111 + 1 - 2;
        colourValueArray[54] = 53733;

        xValueArray[55] = 4;
        yValueArray[55] = 2;
        colourValueArray[55] = 53733;

        xValueArray[56] = 7'b1111111 + 1 - 2;
        yValueArray[56] = 0;
        colourValueArray[56] = 65535;

        xValueArray[57] = 7'b1111111 + 1 - 1;
        yValueArray[57] = 6'b111111 + 1 - 1;
        colourValueArray[57] = 65535;

        xValueArray[58] = 7'b1111111 + 1 - 1;
        yValueArray[58] = 0;
        colourValueArray[58] = 65535;

        xValueArray[59] = 7'b1111111 + 1 - 1;
        yValueArray[59] = 1;
        colourValueArray[59] = 65535;

        xValueArray[60] = 0;
        yValueArray[60] = 6'b111111 + 1 - 2;
        colourValueArray[60] = 65535;

        xValueArray[61] = 0;
        yValueArray[61] = 6'b111111 + 1 - 1;
        colourValueArray[61] = 65535;

        xValueArray[62] = 0;
        yValueArray[62] = 0;
        colourValueArray[62] = 65535;

        xValueArray[63] = 0;
        yValueArray[63] = 1;
        colourValueArray[63] = 65535;

        xValueArray[64] = 0;
        yValueArray[64] = 2;
        colourValueArray[64] = 65535;

        xValueArray[65] = 1;
        yValueArray[65] = 6'b111111 + 1 - 1;
        colourValueArray[65] = 65535;

        xValueArray[66] = 1;
        yValueArray[66] = 0;
        colourValueArray[66] = 65535;

        xValueArray[67] = 1;
        yValueArray[67] = 1;
        colourValueArray[67] = 65535;

        xValueArray[68] = 2;
        yValueArray[68] = 0;
        colourValueArray[68] = 65535;

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
