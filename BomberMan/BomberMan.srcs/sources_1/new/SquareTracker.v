`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2024 17:38:45
// Design Name: 
// Module Name: SquareTracker
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


module SquareTracker(
    input clk6p25m ,
    input [6:0] PlayerMinX , PlayerMaxX , 
    input [5:0] PlayerMinY , PlayerMaxY ,
    output reg[6:0] BombBlock
);
    reg[6:0] FirstBlock , SecondBlock;
    initial begin
        FirstBlock = 7'b0;
        SecondBlock = 7'b0;
    end
    
    wire[69:0] blocks;
    
    WithinXY Block1(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(1) , .max_y(9) , .collided(blocks[0]));
    WithinXY Block2(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(1) , .max_y(9) , .collided(blocks[1]));
    WithinXY Block3(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(1) , .max_y(9) , .collided(blocks[2]));
    WithinXY Block4(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(1) , .max_y(9) , .collided(blocks[3]));
    WithinXY Block5(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(1) , .max_y(9) , .collided(blocks[4]));
    WithinXY Block6(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(1) , .max_y(9) , .collided(blocks[5]));
    WithinXY Block7(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(1) , .max_y(9) , .collided(blocks[6]));
    WithinXY Block8(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(1) , .max_y(9) , .collided(blocks[7]));
    WithinXY Block9(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(1) , .max_y(9) , .collided(blocks[8]));
    WithinXY Block10(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(1) , .max_y(9) , .collided(blocks[9]));
    WithinXY Block11(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(10) , .max_y(18) , .collided(blocks[10]));
    WithinXY Block12(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(10) , .max_y(18) , .collided(blocks[11]));
    WithinXY Block13(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(10) , .max_y(18) , .collided(blocks[12]));
    WithinXY Block14(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(10) , .max_y(18) , .collided(blocks[13]));
    WithinXY Block15(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(10) , .max_y(18) , .collided(blocks[14]));
    WithinXY Block16(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(10) , .max_y(18) , .collided(blocks[15]));
    WithinXY Block17(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(10) , .max_y(18) , .collided(blocks[16]));
    WithinXY Block18(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(10) , .max_y(18) , .collided(blocks[17]));
    WithinXY Block19(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(10) , .max_y(18) , .collided(blocks[18]));
    WithinXY Block20(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(10) , .max_y(18) , .collided(blocks[19]));
    WithinXY Block21(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(19) , .max_y(27) , .collided(blocks[20]));
    WithinXY Block22(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(19) , .max_y(27) , .collided(blocks[21]));
    WithinXY Block23(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(19) , .max_y(27) , .collided(blocks[22]));
    WithinXY Block24(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(19) , .max_y(27) , .collided(blocks[23]));
    WithinXY Block25(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(19) , .max_y(27) , .collided(blocks[24]));
    WithinXY Block26(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(19) , .max_y(27) , .collided(blocks[25]));
    WithinXY Block27(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(19) , .max_y(27) , .collided(blocks[26]));
    WithinXY Block28(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(19) , .max_y(27) , .collided(blocks[27]));
    WithinXY Block29(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(19) , .max_y(27) , .collided(blocks[28]));
    WithinXY Block30(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(19) , .max_y(27) , .collided(blocks[29]));
    WithinXY Block31(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(28) , .max_y(36) , .collided(blocks[30]));
    WithinXY Block32(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(28) , .max_y(36) , .collided(blocks[31]));
    WithinXY Block33(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(28) , .max_y(36) , .collided(blocks[32]));
    WithinXY Block34(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(28) , .max_y(36) , .collided(blocks[33]));
    WithinXY Block35(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(28) , .max_y(36) , .collided(blocks[34]));
    WithinXY Block36(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(28) , .max_y(36) , .collided(blocks[35]));
    WithinXY Block37(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(28) , .max_y(36) , .collided(blocks[36]));
    WithinXY Block38(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(28) , .max_y(36) , .collided(blocks[37]));
    WithinXY Block39(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(28) , .max_y(36) , .collided(blocks[38]));
    WithinXY Block40(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(28) , .max_y(36) , .collided(blocks[39]));
    WithinXY Block41(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(37) , .max_y(45) , .collided(blocks[40]));
    WithinXY Block42(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(37) , .max_y(45) , .collided(blocks[41]));
    WithinXY Block43(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(37) , .max_y(45) , .collided(blocks[42]));
    WithinXY Block44(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(37) , .max_y(45) , .collided(blocks[43]));
    WithinXY Block45(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(37) , .max_y(45) , .collided(blocks[44]));
    WithinXY Block46(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(37) , .max_y(45) , .collided(blocks[45]));
    WithinXY Block47(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(37) , .max_y(45) , .collided(blocks[46]));
    WithinXY Block48(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(37) , .max_y(45) , .collided(blocks[47]));
    WithinXY Block49(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(37) , .max_y(45) , .collided(blocks[48]));
    WithinXY Block50(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(37) , .max_y(45) , .collided(blocks[49]));
    WithinXY Block51(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(46) , .max_y(54) , .collided(blocks[50]));
    WithinXY Block52(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(46) , .max_y(54) , .collided(blocks[51]));
    WithinXY Block53(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(46) , .max_y(54) , .collided(blocks[52]));
    WithinXY Block54(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(46) , .max_y(54) , .collided(blocks[53]));
    WithinXY Block55(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(46) , .max_y(54) , .collided(blocks[54]));
    WithinXY Block56(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(46) , .max_y(54) , .collided(blocks[55]));
    WithinXY Block57(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(46) , .max_y(54) , .collided(blocks[56]));
    WithinXY Block58(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(46) , .max_y(54) , .collided(blocks[57]));
    WithinXY Block59(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(46) , .max_y(54) , .collided(blocks[58]));
    WithinXY Block60(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(46) , .max_y(54) , .collided(blocks[59]));
    WithinXY Block61(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(3) , .max_x(11) , .min_y(55) , .max_y(63) , .collided(blocks[60]));
    WithinXY Block62(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(12) , .max_x(20) , .min_y(55) , .max_y(63) , .collided(blocks[61]));
    WithinXY Block63(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(21) , .max_x(29) , .min_y(55) , .max_y(63) , .collided(blocks[62]));
    WithinXY Block64(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(30) , .max_x(38) , .min_y(55) , .max_y(63) , .collided(blocks[63]));
    WithinXY Block65(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(39) , .max_x(47) , .min_y(55) , .max_y(63) , .collided(blocks[64]));
    WithinXY Block66(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(48) , .max_x(56) , .min_y(55) , .max_y(63) , .collided(blocks[65]));
    WithinXY Block67(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(57) , .max_x(65) , .min_y(55) , .max_y(63) , .collided(blocks[66]));
    WithinXY Block68(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(66) , .max_x(74) , .min_y(55) , .max_y(63) , .collided(blocks[67]));
    WithinXY Block69(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(75) , .max_x(83) , .min_y(55) , .max_y(63) , .collided(blocks[68]));
    WithinXY Block70(.PlayerMinX(PlayerMinX) , .PlayerMaxX(PlayerMaxX) , .PlayerMinY(PlayerMinY) , .PlayerMaxY(PlayerMaxY) , .min_x(84) , .max_x(92) , .min_y(55) , .max_y(63) , .collided(blocks[69]));
    
    
    reg [6:0] i;
    reg [3:0] xBlock;
    reg [2:0] yBlock;
    reg [6:0] min_x;
    reg [5:0] min_y;
    
    always @ (posedge clk6p25m)
    begin
        FirstBlock <= 0;
        SecondBlock <= 0;
        xBlock <= 0;
        yBlock <= 0;
        min_x <= 0;
        min_y <= 0;
        
        for (i = 0; i < 70; i = i + 1) 
        begin
            if(blocks[i])
            begin
                if(FirstBlock == 7'b0)
                begin
                    FirstBlock <= i;
                end
                else
                begin
                    SecondBlock <= i;
                end
            end
        end
        
        if(SecondBlock == 7'b0)
            BombBlock <= FirstBlock;
        else if((SecondBlock - FirstBlock) == 1)
        begin
            xBlock <= (FirstBlock % 10) + 1;
            min_x <= 3 + (xBlock - 1) * 9 ;
            if(PlayerMinX - min_x > 5)
            begin
                BombBlock <= SecondBlock;
            end
            else
            begin
                BombBlock <= FirstBlock;
            end
        end
        else
        begin
            yBlock <= (FirstBlock / 10) + 1;
            min_y <= 3 + (yBlock - 1) * 9 ;
            if(PlayerMinY - min_y > 5)
            begin
                BombBlock <= SecondBlock;
            end
            else
            begin
                BombBlock <= FirstBlock;
            end
        end
    end
endmodule
