`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 11:36:52
// Design Name: 
// Module Name: PixelControl
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


module PixelControl(
    input clk100mhz ,clk6p25m ,
    input btnU , btnD , btnL , btnR,
    input DebouncedBtnC , reset, masterToggle, master_rx,
    input [12:0] pixel_index , input [1:0] slave_rx,
    output[15:0] pixel_data ,
    output led, slave_tx, testLed, led3,
    output [1:0] master_tx,
    output player1_isReviving
);
    
   
   PlayerMovement PlayerMovementControl(
    .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m) , 
    .btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR),
    .pixel_index(pixel_index) ,
    .pixel_data(pixel_data),
    .isCollideLed(led), .DebouncedBtnC(DebouncedBtnC),
    .master_rx(master_rx), .master_tx(master_tx), .slave_rx(slave_rx), .slave_tx(slave_tx),
    .masterToggle(masterToggle), .reset(reset), .testLed(testLed), .led3(led3), .player1_isReviving(player1_isReviving)
);        
   
endmodule