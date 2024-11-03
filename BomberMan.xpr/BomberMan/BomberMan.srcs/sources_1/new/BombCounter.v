`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2024 15:08:38
// Design Name: 
// Module Name: BombCounter
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


module BombCounter(
    input clk6p25m ,
    input immediate_explode,
    input[7:0] FreeBomb,
    input[7:0] MyNumber,
    input edge_registered ,
    output reg active = 0
);
    
    reg[31:0] count = 32'd31250000;
    
    always @ (posedge clk6p25m)
    begin
        //might cause the problem of false activation if edge_registered is still active
        if(edge_registered && (MyNumber == FreeBomb))
        begin
            active <= 1;
        end
        
        if(active == 1'b1)
        begin
            count <= count - 1;
            if(count == 0 | immediate_explode)
            begin
                active <= 1'b0;
                count <= 32'd31250000; //rmb to change
                //count <= 32'd625_0000;
            end
        end
    end
endmodule
