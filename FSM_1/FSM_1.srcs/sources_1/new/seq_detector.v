`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 23:35:15
// Design Name: 
// Module Name: seq_detector
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


module seq_detector(
    input  clk, 
    input  rst, 
    input  in, 
    output reg out
);

parameter ST0 = 0;
parameter ST1 = 1;
parameter ST2 = 2;
parameter ST3 = 3;
parameter ST4 = 4;

reg [2:0] state;
reg [2:0] next_state;

initial
begin
    next_state = ST0;
end

always @ (in or state)
begin
  case (state)
    ST0:
    begin 
		if(in == 1) 
			next_state = ST1;
		else 
			next_state = ST0;
	end
    ST1:
    begin 
		if(in == 0) 
		    next_state = ST2; 
		else if(in == 1) 
		    next_state = ST1;
		end
    ST2:
    begin 
		if(in == 1) 
		    next_state = ST3; 
		else 
		    next_state = ST0;
		end
    ST3:
    begin 
		if(in == 1)
		    next_state = ST4;           
		else if( in == 0) 
		    next_state = ST2;
		end
   endcase 
end

always @ (posedge clk or negedge rst)
begin
  if(!rst)
    state <= ST0;
  else
    state <= next_state;
end

always @ (state or posedge clk) 
begin
  if(state == ST4)
    begin
        state = ST1;
        out = 1;
    end
  else 
     out = 0;
end

endmodule
