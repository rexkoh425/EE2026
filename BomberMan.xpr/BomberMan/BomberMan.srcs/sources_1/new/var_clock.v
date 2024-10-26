`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 09:29:31
// Design Name: 
// Module Name: teer
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


module var_clock(input clk , input[31:0] M , output reg SLOW_CLOCK = 1'b0);

    reg[31:0] COUNT = 32'b0;
    
    always@(posedge clk)
    begin
        COUNT <= (COUNT == M) ? 0 : COUNT +1;
        if(COUNT == 0)
        begin
            SLOW_CLOCK <= ~SLOW_CLOCK;
        end
    end
endmodule