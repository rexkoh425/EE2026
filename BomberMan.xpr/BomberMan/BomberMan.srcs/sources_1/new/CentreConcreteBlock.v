`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 13:15:17
// Design Name: 
// Module Name: CentreConcreteBlock
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


module CentreConcreteBlock 
#(
    parameter dimensions = 9 , 
    parameter minX = 3 ,maxX = 93 ,
    parameter minY = 1 , maxY = 64
)(
    input[12:0] pixel_index , 
    output CenterBlock
);
    localparam num_x_blocks = (maxX - minX) / dimensions; 
    localparam num_y_blocks = (maxY - minY) / dimensions;
    
    genvar x , y;
    wire[((maxY - minY)/dimensions) * ((maxX - minX)/dimensions) - 1 : 0]  block;
    generate
        for (x = minX +dimensions; x < maxX; x = x + 2*dimensions) begin : outer_loop
            for (y = minY + dimensions; y < maxY; y = y + 2*dimensions) begin : mod_inst
                isColourPixel Block(
                    .min_x(x) , .max_x(x+dimensions-1) , 
                    .min_y(y) , .max_y(y+dimensions-1) , 
                    .pixel_index(pixel_index) , .isColouredPixel(block[(num_x_blocks * ((y - minY)/dimensions)) + (((x - minX)/dimensions))])
                );
            end
        end
    endgenerate
    
    assign CenterBlock = |block;
endmodule
