`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:55:19 10/28/2020
// Design Name:   IC2
// Module Name:   D:/XilinxProgramm/XilinxInfo/Project/I2C/Test.v
// Project Name:  I2C
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IC2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test;

	// Inputs
	reg sys_clock;
	reg reset;
	reg [31:0] ctrl_data;
	reg wr_ctrl;

	// Outputs
	wire [31:0] status;

	// Bidirs
	wire SDA;
	wire SCL;

	// Instantiate the Unit Under Test (UUT)
	IC2 uut (
		.SDA(SDA), 
		.SCL(SCL), 
		.sys_clock(sys_clock), 
		.reset(reset), 
		.ctrl_data(ctrl_data), 
		.wr_ctrl(wr_ctrl), 
		.status(status)
	);

initial begin

// Initialize Inputs

sys_clock = 0;

reset = 1;

// Write 'h44 to register 'h55 in I2C slave 'h66

ctrl_data = 32'h00665544;

wr_ctrl = 0;

// Wait 100 ns for global reset to finish

#101;

reset = 0;

// Add stimulus here

#220000

@ (posedge sys_clock) wr_ctrl<= #1 1;

@ (posedge sys_clock) wr_ctrl<= #1 0;

end

always sys_clock = #5 !sys_clock;

endmodule

