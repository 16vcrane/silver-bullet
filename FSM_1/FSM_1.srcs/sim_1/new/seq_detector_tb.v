`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 11:15:05
// Design Name: 
// Module Name: seq_detector_tb
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


module seq_detector_tb(
    );
    reg clk;
    reg rst;
    reg in;
    wire out;

initial
begin
    clk = 0;
    rst = 1;
    #400
    rst = 0;
    #50
    rst = 1;
end

initial
begin
    in = 0;
    
    #20
    in = 1;
    #20
    in = 1;
    #20
    in = 1;
    #20
    in = 0;
    #20
    in = 1;
    #20
    in = 1;
    #20
    in = 0;
    #20
    in = 1;
    #20
    in = 1;
    #20
    in = 0;
    #20
    in = 1;
    #20
    in = 1;
    #20
    in = 1;
    #20
    in = 0;
    #20
    in = 1;
    #20
    in = 1;
end

always #10 clk = ~clk;

seq_detector u_seq_detector(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

endmodule
