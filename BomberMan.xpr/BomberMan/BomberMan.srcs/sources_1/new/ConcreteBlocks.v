`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 11:55:02
// Design Name: 
// Module Name: ConcreteBlocks
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


module ConcreteBlocks(
    input[12:0] pixel_index , 
    output walls , CenterBlock
);

    Walls SideWall(.pixel_index(pixel_index) , .walls(walls));
    CentreConcreteBlock Concrete(.pixel_index(pixel_index) , .CenterBlock(CenterBlock));
    
    
 
    
    
    
    
    
    
    
    
    
    
endmodule
