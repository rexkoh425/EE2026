`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 21:14:56
// Design Name: 
// Module Name: Counter_100MHZ
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


module Counter_100MHZ(input clk , start , input[31:0] threshold , output reg reached = 0);
    
    reg[31:0] count = 32'b0;
    
    always@(posedge clk)
    begin
        if(start == 1'b1)
        begin
            count <= count + 1;
            if(count >= threshold)
            begin
                reached <= 1;
            end
            else begin
                reached <= 0;
            end
        end
        else begin
            count <= 0;
            reached <= 0;
        end
    end
endmodule
