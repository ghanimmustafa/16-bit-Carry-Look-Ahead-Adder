`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:19:14 03/05/2019
// Design Name:   CLA_16
// Module Name:   C:/Users/Mustafa/Desktop/itu_2019_bahar/VLSI 2/Projeler/2nd_project/carry_lock/test_cla.v
// Project Name:  carry_lock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA_16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_cla;

	// Inputs
	reg [15:0] in1;
	reg [15:0] in2;
	reg Cin;

	// Outputs
	wire [15:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	CLA_16 uut (
		.in1(in1), 
		.in2(in2), 
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		Cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		in1=16'd12;
		in2=16'd156151561;
		Cin=1;
		#50
		in1=16'd12;
		in2=16'd17;
		Cin=0;
		#50
		in1=16'd12;
		in2=16'd1;
		Cin=0;
		#50
		in1=16'd780;
		in2=16'd7800;
		Cin=1;
		#50
		in1=16'd65535;
		in2=16'd1;
		Cin=1;
		
        
		// Add stimulus here

	end
      
endmodule

