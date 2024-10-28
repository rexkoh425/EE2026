`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2024 11:43:34
// Design Name: 
// Module Name: sim_flickerBomb
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


module sim_flickerBomb(

    );
    
    reg clock;
    reg pixel_index;
    reg FreeBomb = 1;
    reg edge_registered = 1;
    reg startFlicker;
    wire stopFlicker;
    wire bombs;
    wire bombPixelData;
    wire isRed;
    
    flickerBomb flickerBomb(.clock(clock), .start(startFlicker),
                   .bombCounter(32'd31250000),
                   .isRed(isRed), .stop(stopFlicker)
                   );
                  
    initial begin
        clock = 0;
        pixel_index = 0;
    end
    
    always begin
        #5 clock <= ~clock;
        #5 pixel_index = pixel_index == 6143 ? 0 : pixel_index + 1;
    end
endmodule
