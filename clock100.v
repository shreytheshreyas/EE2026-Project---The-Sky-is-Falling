`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 01:00:05 AM
// Design Name: 
// Module Name: clock100
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


module clock100(
    input basys_clock,
    output out_clock
    );
    reg[22:0] count=23'b0; //95 Hz
        always@(posedge basys_clock) begin
        count<=count+1;
        end
    
        assign out_clock=count[22];
        
endmodule
