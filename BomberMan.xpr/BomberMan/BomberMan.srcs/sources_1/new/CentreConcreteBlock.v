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


module CentreConcreteBlock(
    input[12:0] pixel_index , 
    output CenterBlock
);

    parameter dimensions = 9; //just for log of dimension of block
    
    wire block1, block2, block3, block4, block5, block6, block7, block8, block9, block10, 
    block11, block12, block13, block14, block15, block16, block17, block18, block19, block20, 
    block21, block22, block23, block24, block25, block26, block27, block28, block29, block30, 
    block31, block32, block33, block34, block35, block36, block37, block38, block39, block40, 
    block41, block42, block43, block44, block45, block46, block47, block48, block49, block50, 
    block51, block52, block53, block54, block55, block56, block57, block58, block59, block60, 
    block61, block62, block63, block64, block65, block66, block67, block68, block69, block70;
    
    isColourPixel Block1(.min_x(3) , .max_x(11) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block1));
    isColourPixel Block2(.min_x(12) , .max_x(20) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block2));
    isColourPixel Block3(.min_x(21) , .max_x(29) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block3));
    isColourPixel Block4(.min_x(30) , .max_x(38) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block4));
    isColourPixel Block5(.min_x(39) , .max_x(47) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block5));
    isColourPixel Block6(.min_x(48) , .max_x(56) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block6));
    isColourPixel Block7(.min_x(57) , .max_x(65) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block7));
    isColourPixel Block8(.min_x(66) , .max_x(74) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block8));
    isColourPixel Block9(.min_x(75) , .max_x(83) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block9));
    isColourPixel Block10(.min_x(84) , .max_x(92) , .min_y(1) , .max_y(9) , .pixel_index(pixel_index) , .isColouredPixel(block10));
    isColourPixel Block11(.min_x(3) , .max_x(11) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block11));
    isColourPixel Block12(.min_x(12) , .max_x(20) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block12));
    isColourPixel Block13(.min_x(21) , .max_x(29) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block13));
    isColourPixel Block14(.min_x(30) , .max_x(38) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block14));
    isColourPixel Block15(.min_x(39) , .max_x(47) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block15));
    isColourPixel Block16(.min_x(48) , .max_x(56) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block16));
    isColourPixel Block17(.min_x(57) , .max_x(65) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block17));
    isColourPixel Block18(.min_x(66) , .max_x(74) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block18));
    isColourPixel Block19(.min_x(75) , .max_x(83) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block19));
    isColourPixel Block20(.min_x(84) , .max_x(92) , .min_y(10) , .max_y(18) , .pixel_index(pixel_index) , .isColouredPixel(block20));
    isColourPixel Block21(.min_x(3) , .max_x(11) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block21));
    isColourPixel Block22(.min_x(12) , .max_x(20) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block22));
    isColourPixel Block23(.min_x(21) , .max_x(29) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block23));
    isColourPixel Block24(.min_x(30) , .max_x(38) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block24));
    isColourPixel Block25(.min_x(39) , .max_x(47) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block25));
    isColourPixel Block26(.min_x(48) , .max_x(56) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block26));
    isColourPixel Block27(.min_x(57) , .max_x(65) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block27));
    isColourPixel Block28(.min_x(66) , .max_x(74) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block28));
    isColourPixel Block29(.min_x(75) , .max_x(83) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block29));
    isColourPixel Block30(.min_x(84) , .max_x(92) , .min_y(19) , .max_y(27) , .pixel_index(pixel_index) , .isColouredPixel(block30));
    isColourPixel Block31(.min_x(3) , .max_x(11) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block31));
    isColourPixel Block32(.min_x(12) , .max_x(20) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block32));
    isColourPixel Block33(.min_x(21) , .max_x(29) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block33));
    isColourPixel Block34(.min_x(30) , .max_x(38) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block34));
    isColourPixel Block35(.min_x(39) , .max_x(47) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block35));
    isColourPixel Block36(.min_x(48) , .max_x(56) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block36));
    isColourPixel Block37(.min_x(57) , .max_x(65) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block37));
    isColourPixel Block38(.min_x(66) , .max_x(74) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block38));
    isColourPixel Block39(.min_x(75) , .max_x(83) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block39));
    isColourPixel Block40(.min_x(84) , .max_x(92) , .min_y(28) , .max_y(36) , .pixel_index(pixel_index) , .isColouredPixel(block40));
    isColourPixel Block41(.min_x(3) , .max_x(11) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block41));
    isColourPixel Block42(.min_x(12) , .max_x(20) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block42));
    isColourPixel Block43(.min_x(21) , .max_x(29) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block43));
    isColourPixel Block44(.min_x(30) , .max_x(38) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block44));
    isColourPixel Block45(.min_x(39) , .max_x(47) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block45));
    isColourPixel Block46(.min_x(48) , .max_x(56) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block46));
    isColourPixel Block47(.min_x(57) , .max_x(65) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block47));
    isColourPixel Block48(.min_x(66) , .max_x(74) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block48));
    isColourPixel Block49(.min_x(75) , .max_x(83) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block49));
    isColourPixel Block50(.min_x(84) , .max_x(92) , .min_y(37) , .max_y(45) , .pixel_index(pixel_index) , .isColouredPixel(block50));
    isColourPixel Block51(.min_x(3) , .max_x(11) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block51));
    isColourPixel Block52(.min_x(12) , .max_x(20) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block52));
    isColourPixel Block53(.min_x(21) , .max_x(29) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block53));
    isColourPixel Block54(.min_x(30) , .max_x(38) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block54));
    isColourPixel Block55(.min_x(39) , .max_x(47) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block55));
    isColourPixel Block56(.min_x(48) , .max_x(56) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block56));
    isColourPixel Block57(.min_x(57) , .max_x(65) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block57));
    isColourPixel Block58(.min_x(66) , .max_x(74) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block58));
    isColourPixel Block59(.min_x(75) , .max_x(83) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block59));
    isColourPixel Block60(.min_x(84) , .max_x(92) , .min_y(46) , .max_y(54) , .pixel_index(pixel_index) , .isColouredPixel(block60));
    isColourPixel Block61(.min_x(3) , .max_x(11) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block61));
    isColourPixel Block62(.min_x(12) , .max_x(20) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block62));
    isColourPixel Block63(.min_x(21) , .max_x(29) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block63));
    isColourPixel Block64(.min_x(30) , .max_x(38) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block64));
    isColourPixel Block65(.min_x(39) , .max_x(47) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block65));
    isColourPixel Block66(.min_x(48) , .max_x(56) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block66));
    isColourPixel Block67(.min_x(57) , .max_x(65) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block67));
    isColourPixel Block68(.min_x(66) , .max_x(74) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block68));
    isColourPixel Block69(.min_x(75) , .max_x(83) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block69));
    isColourPixel Block70(.min_x(84) , .max_x(92) , .min_y(55) , .max_y(63) , .pixel_index(pixel_index) , .isColouredPixel(block70));
    
    assign CenterBlock = block12 | block14 | block16 | block18 | block20 | block32 | block34 | block36 | block38 | block40 | block52 | block54 | block56 | block58 | block60 ;
  
endmodule
