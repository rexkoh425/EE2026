#include <iostream>
#include <vector>
#include <fstream>
#include <sstream>
#include <string>

int main () {
    // writing function prototype
    std::string function_name;
    std::cout << "Input function name: ";
    std::cout << "\n";
    std::cin >> function_name;

    std::string wire_name;
    std::cout << "Input output wire name: ";
    std::cout << "\n";
    std::cin >> wire_name;

    // inputing colour const values
    std::string colourFile;
    std::cout << "Input your colour file name: ";
    std::cin >> colourFile;
    std::ifstream colour_file(colourFile); // Open the file
    if (!colour_file.is_open()) {
        std::cerr << "Failed to open the file." << std::endl;
        return 1;
    }

    std::string colour_line;
    int num_colours = 0;
    std::vector<std::string> colour_const_array;
    // Read the file line by line
    while (std::getline(colour_file, colour_line)) {
        std::istringstream iss(colour_line); // Convert the line into a stream
        std::string word;
        num_colours++;
        
        // Extract each word from the line
        while (iss >> word) {
            std::cout << "Colour: " << word << std::endl;;
            colour_const_array.push_back(word); 
        }
    }

    colour_file.close(); // Close the file

    std::string coordFile;
    std::cout << "Input your coordinates-colour file name: ";
    std::cin >> coordFile;
    std::ifstream coord_file(coordFile); // Open the file
    if (!coord_file.is_open()) {
        std::cerr << "Failed to open the file." << std::endl;
        return 1;
    }

    std::string coord_line;
    int num_pts;
    std::vector<std::string> x_array;
    std::vector<std::string> y_array;
    std::vector<std::string> colour_array;
    // Read the file line by line
    while (std::getline(coord_file, coord_line)) {
        std::istringstream iss(coord_line); // Convert the line into a stream
        std::string word;
        num_pts++;
        
        // Extract each word from the line
        int id = 0;
        while (iss >> word) {
            // std::cout << "Word: " << word << std::endl;
            if (!id) {
                std::cout << "X: " << word << std::endl;
                x_array.push_back(word);
                id++;
            } else if (id == 1) {
                std::cout << "Y: " << word << std::endl;
                y_array.push_back(word);
                id++;
            } else {
                std::cout << "colour: " << word << std::endl;
                colour_array.push_back(word);
                id = 0;
            }
        }
    }

    coord_file.close(); // Close the file
    int centerX, centerY;
    std::cout << "Please input your centre coordinates: \nX: ";
    std::cin >> centerX;
    std::cout << "Y: ";
    std::cin >> centerY;

    std::cout << "\nPlease paste this in your verilog: \n";
    std::cout << "module " << function_name << "(\n    input [6:0] centreX, \n    input [5:0] centreY, \n    input [12:0] pixel_index, \n    input clock, \n    input [15:0] bg_data, \n    output reg [15:0] " << wire_name << "\n);";

    std::cout << "\n\n    integer numPoints = " << num_pts << ";\n";
    
    for (int i = 0; i < num_colours; i++) {
        std::cout << "    reg [15:0]" << colour_const_array[i] << ";\n";
    }

    std::cout << "    integer i;\n    reg [6:0] xValueArray[0:" << num_pts << "];\n";
    std::cout << "    reg [5:0] yValueArray[0:" << num_pts << "];\n";
    std::cout << "    reg [15:0] colourValueArray[0:" << num_pts << "];\n";
    std::cout << "    reg [6:0] x_value_check;\n    reg [5:0] y_value_check\n";
    std::cout << "\n    initial begin\n\n";
    for (int j = 0; j < num_pts; j++) {
        std::string strX = x_array[j];
        if (std::stoi(x_array[j]) - centerX < 0) {
            std::cout << "        xValueArray[" << j << "] = 7'b1111111 + 1 - " << centerX - std::stoi(x_array[j]) << ";\n";
        } else {
            std::cout << "        xValueArray[" << j << "] = " << std::stoi(x_array[j]) - centerX << ";\n";
        }
        if (std::stoi(y_array[j]) - centerY < 0) {
            std::cout << "        yValueArray[" << j << "] = 6'b111111 + 1 - " << centerY - std::stoi(y_array[j]) << ";\n";
        } else {
            std::cout << "        yValueArray[" << j << "] = " << std::stoi(y_array[j]) - centerY << ";\n";
        }
        std::cout << "        colourValueArray[" << j << "] = " << colour_array[j] << ";\n\n";
    } 

    std::cout << "    end\n";

    std::cout << "\n    always @ (posedge clock) begin\n        pixel_data <= bg_data;\n        for (i = 0; i < numPoints; i = i + 1) begin\n            x_value_check = centreX + xValueArray[i];\n             y_value_check = centreY + yValueArray[i];\n            if ( (pixel_index / 96 == y_value_check) && (pixel_index % 96 == x_value_check) ) begin \n                pixel_data <= colourValueArray[i];\n            end\n        end\n    end\nendmodule";
}