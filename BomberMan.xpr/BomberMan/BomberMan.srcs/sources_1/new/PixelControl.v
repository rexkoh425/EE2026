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
    input initiate_reset,
    input btnU , btnD , btnL , btnR , btnC ,
    input [15:0]SW , 
    input DebouncedBtnC ,
    input [12:0] pixel_index ,
    input start_game,
    input reset, masterToggle, 
    input [2:0] master_rx,
    input [3:0] slave_rx,
    output[15:0] pixel_data ,
    output [2:0] slave_tx, output reg [15:0] led = 0,
    output reg SWCheck = 0,
    output [3:0] master_tx,
    output player1_isReviving,player2_isReviving,player3_isReviving,player4_isReviving
);
   parameter dimensions = 9;
   parameter minX = 3 ,maxX = 93;
   parameter minY = 1 , maxY = 64;
   parameter player_dimensions = 7;
   //Squaretracker tracks player
   //Concrete blocks builds concrete blocks
   //Collision tracker in PlayerMovement tracks if player hit concrete
   
   wire CenterBlock , walls;
    
   ConcreteBlocks #(dimensions,minX,maxX,minY,maxY) ConcreteBlock(
      .pixel_index(pixel_index) ,
      .walls(walls) , .CenterBlock(CenterBlock)
   );
   /////////////////////////////////////////////////////////////////////////
   //self implemented uart sections
   wire player1;
   wire[6:0] Player1MinX , Player1MaxX;
   wire[5:0] Player1MinY , Player1MaxY;
   reg btnUPlayer1,btnDPlayer1,btnLPlayer1,btnRPlayer1,btnCPlayer1;
   wire[6:0] Player1Block;
   wire player1_die;
   
   /*assign btnUPlayer1 = SW[5] ? btnU : 0;
   assign btnDPlayer1 = SW[5] ? btnD : 0;
   assign btnLPlayer1 = SW[5] ? btnL : 0;
   assign btnRPlayer1 = SW[5] ? btnR : 0;
   assign btnCPlayer1 = SW[5] ? btnC : 0;
   assign Player1DebouncedBtnC = SW[5] ? DebouncedBtnC : 0;*/
   
   reg btnUPlayer2,btnDPlayer2,btnLPlayer2,btnRPlayer2,btnCPlayer2;
   wire player2;
   wire[6:0] Player2MinX , Player2MaxX;
   wire[5:0] Player2MinY , Player2MaxY;
   wire[6:0] Player2Block;
   wire player2_die;
   
   /*assign btnUPlayer2 = SW[6] ? btnU : 0;
   assign btnDPlayer2 = SW[6] ? btnD : 0;
   assign btnLPlayer2 = SW[6] ? btnL : 0;
   assign btnRPlayer2 = SW[6] ? btnR : 0;
   assign btnCPlayer2 = SW[6] ? btnC : 0;
   assign Player2DebouncedBtnC = SW[6] ? DebouncedBtnC : 0;*/
      
   reg btnUPlayer3,btnDPlayer3,btnLPlayer3,btnRPlayer3,btnCPlayer3;
   wire player3;
   wire[6:0] Player3MinX , Player3MaxX;
   wire[5:0] Player3MinY , Player3MaxY;
   wire[6:0] Player3Block;
   wire player3_die;
   
   /*assign btnUPlayer3 = SW[7] ? btnU : 0;
   assign btnDPlayer3 = SW[7] ? btnD : 0;
   assign btnLPlayer3 = SW[7] ? btnL : 0;
   assign btnRPlayer3 = SW[7] ? btnR : 0;
   assign btnCPlayer3 = SW[7] ? btnC : 0;
   assign Player3DebouncedBtnC = SW[7] ? DebouncedBtnC : 0;*/
      
   reg btnUPlayer4,btnDPlayer4,btnLPlayer4,btnRPlayer4,btnCPlayer4;
   wire player4;
   wire[6:0] Player4MinX , Player4MaxX;
   wire[5:0] Player4MinY , Player4MaxY;
   wire[6:0] Player4Block;
   wire player4_die;
   
   /*assign btnUPlayer4 = SW[8] ? btnU : 0;
   assign btnDPlayer4 = SW[8] ? btnD : 0;
   assign btnLPlayer4 = SW[8] ? btnL : 0;
   assign btnRPlayer4 = SW[8] ? btnR : 0;
   assign btnCPlayer4 = SW[8] ? btnC : 0;
   assign Player4DebouncedBtnC = SW[8] ? DebouncedBtnC : 0;*/
   /////////////////////////////////////////////////////////////////////////////////////////////
   PlayerMovement 
   #(4,10,2,8,dimensions,minX,maxX,minY,maxY) 
   Player1MovementControl(
       .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
       //.btnU(btnU) , .btnD(btnD) , .btnL(btnL) , .btnR(btnR) , .btnC(btnC) ,
       .btnU(btnUPlayer1) , .btnD(btnDPlayer1) , .btnL(btnLPlayer1) , .btnR(btnRPlayer1) , .btnC(btnCPlayer1) ,
       .pixel_index(pixel_index) ,
       .player_isReviving(player1_isReviving),
       .start_game(start_game), .initiate_reset(initiate_reset),
       ////output
       .player(player1),
       .PlayerMinX(Player1MinX) , .PlayerMaxX(Player1MaxX) ,
       .PlayerMinY(Player1MinY) , .PlayerMaxY(Player1MaxY) ,
       .PlayerBlock(Player1Block)
   );
  
  PlayerMovement 
  #(87,93,2,8,dimensions,minX,maxX,minY,maxY) 
  Player2MovementControl(
      .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
      .btnU(btnUPlayer2) , .btnD(btnDPlayer2) , .btnL(btnLPlayer2) , .btnR(btnRPlayer2) , .btnC(btnCPlayer2) ,
      .pixel_index(pixel_index) ,
      .player_isReviving(player2_isReviving),
      .start_game(start_game), .initiate_reset(initiate_reset),
      ////output
      .player(player2),
      .PlayerMinX(Player2MinX) , .PlayerMaxX(Player2MaxX) ,
      .PlayerMinY(Player2MinY) , .PlayerMaxY(Player2MaxY) ,
      .PlayerBlock(Player2Block)
  );
    
    PlayerMovement 
    #(4,10,57,63,dimensions,minX,maxX,minY,maxY) 
    Player3MovementControl(
        .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
        .btnU(btnUPlayer3) , .btnD(btnDPlayer3) , .btnL(btnLPlayer3) , .btnR(btnRPlayer3) , .btnC(btnCPlayer3) ,
        .pixel_index(pixel_index) ,
        .player_isReviving(player3_isReviving),
        .start_game(start_game), .initiate_reset(initiate_reset),
        ////output
        .player(player3),
        .PlayerMinX(Player3MinX) , .PlayerMaxX(Player3MaxX) ,
        .PlayerMinY(Player3MinY) , .PlayerMaxY(Player3MaxY) ,
        .PlayerBlock(Player3Block)
    );
    
    PlayerMovement 
    #(87,93,57,63,dimensions,minX,maxX,minY,maxY) 
    Player4MovementControl(
        .clk100mhz(clk100mhz) , .clk6p25m(clk6p25m),
        .btnU(btnUPlayer4) , .btnD(btnDPlayer4) , .btnL(btnLPlayer4) , .btnR(btnRPlayer4) , .btnC(btnCPlayer4) ,
        .pixel_index(pixel_index) ,
        .player_isReviving(player4_isReviving),
        .start_game(start_game), .initiate_reset(initiate_reset),
        ////output
        .player(player4),
        .PlayerMinX(Player4MinX) , .PlayerMaxX(Player4MaxX) ,
        .PlayerMinY(Player4MinY) , .PlayerMaxY(Player4MaxY) ,
        .PlayerBlock(Player4Block)
    );
   
   wire bomb;
   wire ExplosionAnimations;

   Bomb BombControl(
       .clk6p25m(clk6p25m),
       .pixel_index(pixel_index) ,
       .bomb(bomb),.SW(SW),
       
       .Player1Block(Player1Block) ,
       .Player1DebouncedBtnC(btnCPlayer1), 
       .player1_die(player1_die),
       .player1_isReviving(player1_isReviving),
       
       .Player2Block(Player2Block) ,
       .Player2DebouncedBtnC(btnCPlayer2), 
       .player2_die(player2_die),
       .player2_isReviving(player3_isReviving),
       
       .Player3Block(Player3Block) ,
       .Player3DebouncedBtnC(btnCPlayer3), 
       .player3_die(player3_die),
       .player3_isReviving(player3_isReviving),
       
       .Player4Block(Player4Block),
       .Player4DebouncedBtnC(btnCPlayer4), 
       .player4_die(player4_die),
       .player4_isReviving(player4_isReviving),
       
       .ExplosionAnimations(ExplosionAnimations),
       .start_game(start_game)
   );
   
   PixelDataControl ColourControl(
       .clk6p25m(clk6p25m) , 
       .player1_die(player1_die), .player2_die(player2_die), .player3_die(player3_die), .player4_die(player4_die),
       .walls(walls) , .CenterBlock(CenterBlock), 
       .player1(player1) , .player2(player2) ,.player3(player3) ,.player4(player4) ,
       .bomb(bomb) , .ExplosionAnimations(ExplosionAnimations),
       .pixel_data(pixel_data) ,
       .player1_isReviving(player1_isReviving) , .player2_isReviving(player2_isReviving) ,
       .player3_isReviving(player3_isReviving) , .player4_isReviving(player4_isReviving) ,
       .start_game(start_game), .pixel_index(pixel_index)
   );
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
   //uart start   
      wire start1,start2,start3;
   
      slave_tx slave_tx_module(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .DebouncedBtnC(btnC),
          .tx(slave_tx[0]), .start(start1), .SW(SW[1])
      );
      
      slave_tx slave_tx_module2(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .DebouncedBtnC(btnC),
          .tx(slave_tx[1]), .start(start2), .SW(SW[2])
      );
         
      slave_tx slave_tx_module3(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnU), .btnD(btnD), .btnL(btnL), .btnR(btnR), .DebouncedBtnC(btnC),
          .tx(slave_tx[2]), .start(start3), .SW(SW[3])
      );
      
      wire [31:0] rx_data_master;
      wire [31:0] rx_data_master2;
      wire [31:0] rx_data_master3;
      reg valid_master_flag1, valid_master_flag2, valid_master_flag3;
      wire valid_master1, valid_master2, valid_master3;
      
      uart_rx_new master_rx_module(
          .clk(clk100mhz), .reset(reset), .rx(master_rx[0]), 
          .data(rx_data_master), .valid(valid_master1)
      );

      uart_rx_new master_rx_module2(
          .clk(clk100mhz), .reset(reset), .rx(master_rx[1]), 
          .data(rx_data_master2), .valid(valid_master2)
      );
      
      uart_rx_new master_rx_module3(
          .clk(clk100mhz), .reset(reset), .rx(master_rx[2]), 
          .data(rx_data_master3), .valid(valid_master3)
      );         
      
      master_tx master_tx_module1(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnUPlayer1), .btnD(btnDPlayer1), .btnL(btnLPlayer1),
          .btnR(btnRPlayer1), .btnC(btnCPlayer1), .led(led),                           
          .tx(master_tx[0])
      );
       
      master_tx master_tx_module2(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnUPlayer2), .btnD(btnDPlayer2), .btnL(btnLPlayer2),
          .btnR(btnRPlayer2), .btnC(btnCPlayer2), .led(led[3:0]),
          .tx(master_tx[1])
      );
      
      master_tx master_tx_module3(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnUPlayer3), .btnD(btnDPlayer3), .btnL(btnLPlayer3),
          .btnR(btnRPlayer3), .btnC(btnCPlayer3), .led(led[3:0]),
          .tx(master_tx[2])
      );        
      master_tx master_tx_module4(
          .clk(clk100mhz), .reset(reset),
          .btnU(btnUPlayer4), .btnD(btnDPlayer4), .btnL(btnLPlayer4),
          .btnR(btnRPlayer4), .btnC(btnCPlayer4), .led(led[3:0]),
          .tx(master_tx[3])
      );     
      wire [31:0] rx_data_slave;
      reg valid_slave_flag;
      wire valid_slave;
      
      uart_rx_new slave_rx_module(
          .clk(clk100mhz), .reset(reset),
          .rx(slave_rx[0]), .data(rx_data_slave), .valid(valid_slave)
      );
      
      wire [31:0] rx_data_slave2;
      reg valid_slave_flag2;
      wire valid_slave2;
      
      uart_rx_new slave_rx_module2(
          .clk(clk100mhz), .reset(reset),
          .rx(slave_rx[1]), .data(rx_data_slave2), .valid(valid_slave2)
      );
      
      wire [31:0] rx_data_slave3;
      reg valid_slave_flag3;
      wire valid_slave3;
      uart_rx_new slave_rx_module3(
          .clk(clk100mhz), .reset(reset),
          .rx(slave_rx[2]), .data(rx_data_slave3), .valid(valid_slave3)
      );
      
      wire [31:0] rx_data_slave4;
      reg valid_slave_flag4;
      wire valid_slave4;
      uart_rx_new slave_rx_module4(
          .clk(clk100mhz), .reset(reset),
          .rx(slave_rx[3]), .data(rx_data_slave4), .valid(valid_slave4)
      );
                  
      wire clk_40hz;
      var_clock clk40hz2(.clk(clk100mhz), .M(32'd1249999), .SLOW_CLOCK(clk_40hz));
      always @(posedge clk_40hz) begin
           if (masterToggle) begin
               led[3:0] <= {rx_data_master3[31],rx_data_master2[31],rx_data_master[31],SW[0]};
               SWCheck <= rx_data_master[31] & SW[0];
               if (SWCheck) begin
                   case (rx_data_master[7:0])
                       8'h01: begin // Move Up   
                           btnUPlayer2 <= 1;
                           btnDPlayer2 <= 0;
                           btnLPlayer2 <= 0;
                           btnRPlayer2 <= 0;
                           btnCPlayer2 <= 0;                     
                       end
                       8'h02: begin // Move Down    
                           btnUPlayer2 <= 0;
                           btnDPlayer2 <= 1;
                           btnLPlayer2 <= 0;
                           btnRPlayer2 <= 0;
                           btnCPlayer2 <= 0;                         
                       end
                       8'h03: begin // Move Left
                           btnUPlayer2 <= 0;
                           btnDPlayer2 <= 0;
                           btnLPlayer2 <= 1;
                           btnRPlayer2 <= 0;
                           btnCPlayer2 <= 0;                   
                       end
                       8'h04: begin // Move Right
                           btnUPlayer2 <= 0;
                           btnDPlayer2 <= 0;
                           btnLPlayer2 <= 0;
                           btnRPlayer2 <= 1;
                           btnCPlayer2 <= 0;                      
                       end
                       8'h05: begin
                           btnUPlayer2 <= 0;
                           btnDPlayer2 <= 0;
                           btnLPlayer2 <= 0;
                           btnRPlayer2 <= 0;
                           btnCPlayer2 <= 1;  
                       end
                       default: begin
                           btnUPlayer2 <= 0;
                           btnDPlayer2 <= 0;
                           btnLPlayer2 <= 0;
                           btnRPlayer2 <= 0;
                           btnCPlayer2 <= 0;                          
                       end
                   endcase  
                   
                   case (rx_data_master2[7:0])
                       8'h01: begin // Move Up   
                           btnUPlayer3 <= 1;
                           btnDPlayer3 <= 0;
                           btnLPlayer3 <= 0;
                           btnRPlayer3 <= 0;
                           btnCPlayer3 <= 0;                     
                       end
                       8'h02: begin // Move Down    
                           btnUPlayer3 <= 0;
                           btnDPlayer3 <= 1;
                           btnLPlayer3 <= 0;
                           btnRPlayer3 <= 0;
                           btnCPlayer3 <= 0;                         
                       end
                       8'h03: begin // Move Left
                           btnUPlayer3 <= 0;
                           btnDPlayer3 <= 0;
                           btnLPlayer3 <= 1;
                           btnRPlayer3 <= 0;
                           btnCPlayer3 <= 0;                   
                       end
                       8'h04: begin // Move Right
                           btnUPlayer3 <= 0;
                           btnDPlayer3 <= 0;
                           btnLPlayer3 <= 0;
                           btnRPlayer3 <= 1;
                           btnCPlayer3 <= 0;                      
                       end
                       8'h05: begin
                           btnUPlayer3 <= 0;
                           btnDPlayer3 <= 0;
                           btnLPlayer3 <= 0;
                           btnRPlayer3 <= 0;
                           btnCPlayer3 <= 1;  
                       end
                       default: begin
                           btnUPlayer3 <= 0;
                           btnDPlayer3 <= 0;
                           btnLPlayer3 <= 0;
                           btnRPlayer3 <= 0;
                           btnCPlayer3 <= 0;                          
                       end
                   endcase     
                   
                   case (rx_data_master3[7:0])
                       8'h01: begin // Move Up   
                           btnUPlayer4 <= 1;
                           btnDPlayer4 <= 0;
                           btnLPlayer4 <= 0;
                           btnRPlayer4 <= 0;
                           btnCPlayer4 <= 0;                     
                       end
                       8'h02: begin // Move Down    
                           btnUPlayer4 <= 0;
                           btnDPlayer4 <= 1;
                           btnLPlayer4 <= 0;
                           btnRPlayer4 <= 0;
                           btnCPlayer4 <= 0;                         
                       end
                       8'h03: begin // Move Left
                           btnUPlayer4 <= 0;
                           btnDPlayer4 <= 0;
                           btnLPlayer4 <= 1;
                           btnRPlayer4 <= 0;
                           btnCPlayer4 <= 0;                   
                       end
                       8'h04: begin // Move Right
                           btnUPlayer4 <= 0;
                           btnDPlayer4 <= 0;
                           btnLPlayer4 <= 0;
                           btnRPlayer4 <= 1;
                           btnCPlayer4 <= 0;                      
                       end
                       8'h05: begin
                           btnUPlayer4 <= 0;
                           btnDPlayer4 <= 0;
                           btnLPlayer4 <= 0;
                           btnRPlayer4 <= 0;
                           btnCPlayer4 <= 1;  
                       end
                       default: begin
                           btnUPlayer4 <= 0;
                           btnDPlayer4 <= 0;
                           btnLPlayer4 <= 0;
                           btnRPlayer4 <= 0;
                           btnCPlayer4 <= 0;                          
                       end
                   endcase   
                                                
                   if (btnU) begin
                       btnUPlayer1 <= 1;
                       btnDPlayer1 <= 0;
                       btnLPlayer1 <= 0;
                       btnRPlayer1 <= 0;
                       btnCPlayer1 <= 0;               
                   end else if (btnD) begin 
                       btnUPlayer1 <= 0;
                       btnDPlayer1 <= 1;
                       btnLPlayer1 <= 0;
                       btnRPlayer1 <= 0;
                       btnCPlayer1 <= 0;               
                   end else if (btnL) begin 
                       btnUPlayer1 <= 0;
                       btnDPlayer1 <= 0;
                       btnLPlayer1 <= 1;
                       btnRPlayer1 <= 0;
                       btnCPlayer1 <= 0;             
                   end else if (btnR) begin  
                       btnUPlayer1 <= 0;
                       btnDPlayer1 <= 0;
                       btnLPlayer1 <= 0;
                       btnRPlayer1 <= 1;
                       btnCPlayer1 <= 0;              
                   end else if (DebouncedBtnC) begin
                       btnUPlayer1 <= 0;
                       btnDPlayer1 <= 0;
                       btnLPlayer1 <= 0;
                       btnRPlayer1 <= 0;
                       btnCPlayer1 <= 1;             
                   end else begin
                       btnUPlayer1 <= 0;
                       btnDPlayer1 <= 0;
                       btnLPlayer1 <= 0;
                       btnRPlayer1 <= 0;
                       btnCPlayer1 <= 0;              
                   end
               end 
           end else begin
               btnUPlayer1 <= rx_data_slave[31];
               btnDPlayer1 <= rx_data_slave[30];
               btnLPlayer1 <= rx_data_slave[29];
               btnRPlayer1 <= rx_data_slave[28];
               btnCPlayer1 <= rx_data_slave[27]; 
               btnUPlayer2 <= rx_data_slave2[31];
               btnDPlayer2 <= rx_data_slave2[30];
               btnLPlayer2 <= rx_data_slave2[29];
               btnRPlayer2 <= rx_data_slave2[28];
               btnCPlayer2 <= rx_data_slave2[27];
               btnUPlayer3 <= rx_data_slave3[31];
               btnDPlayer3 <= rx_data_slave3[30];
               btnLPlayer3 <= rx_data_slave3[29];
               btnRPlayer3 <= rx_data_slave3[28];
               btnCPlayer3 <= rx_data_slave3[27];
               btnUPlayer4 <= rx_data_slave4[31];
               btnDPlayer4 <= rx_data_slave4[30];
               btnLPlayer4 <= rx_data_slave4[29];
               btnRPlayer4 <= rx_data_slave4[28];
               btnCPlayer4 <= rx_data_slave4[27];
               led[3:0] <= rx_data_slave[26:23];
               SWCheck <= rx_data_slave[24] & rx_data_slave[23];                        
           end
      end
endmodule