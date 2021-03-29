`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 12:01:09 AM
// Design Name: 
// Module Name: clock_oled
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


module clock_oled(input basys_clock, output reg out_clk=0);
   
    reg [3:0] count=0;
    always @ (posedge basys_clock)
    begin
        count<= count+1;
        out_clk<=(count==0)?~out_clk:out_clk;
    end
endmodule
