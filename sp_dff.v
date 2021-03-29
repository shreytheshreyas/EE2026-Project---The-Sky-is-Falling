`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 02:38:20 AM
// Design Name: 
// Module Name: sp_dff
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


module sp_dff(
    input basys_clock,
    input pushbutton,
    output btnc
    );
    wire dff_one_out, dff_two_out, out_clock;
    
        clock100 clk_dff(basys_clock, out_clock);
        dff dff_one(out_clock, pushbutton, dff_one_out);
        dff dff_two(out_clock, dff_one_out, dff_two_out);
        
        assign btnc=dff_one_out&~dff_two_out;
        
endmodule
