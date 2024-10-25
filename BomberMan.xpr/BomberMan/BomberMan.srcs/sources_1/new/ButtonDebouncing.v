`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 21:33:02
// Design Name: 
// Module Name: ButtonDebouncing
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


module ButtonDebouncing(input button , clk , output reg DebouncedSignal);

    reg start = 1'b0;
    wire reached;
    reg pressed = 1'b0;
    Counter_100MHZ counter(.clk(clk) , .start(start) , .threshold(32'd20000000) , .reached(reached));
    wire clk1khz;
    var_clock clock_1khz(clk , 32'd49999 , clk1khz);
    
    always @ (posedge clk1khz)
    begin
        if(pressed == 1'b0)
        begin
            if(button == 1'b1)
            begin
                DebouncedSignal <= 1'b1;
                start <= 1'b1;
                pressed <= 1'b1;
            end
            else begin
                DebouncedSignal <= 1'b0;
            end
        end
        if(button == 1'b0 & reached == 1'b1)
        begin
            pressed <= 1'b0;
            start <= 1'b0;
        end
    end
endmodule
