`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:56 03/04/2019 
// Design Name: 
// Module Name:    dgssdg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////
//4-bit Carry Look Ahead Adder 
////////////////////////////////////////////////////////
 
module CLA_4(in1,in2, Cin, Sum,Cout);
input [3:0] in1,in2;
input Cin;
output [3:0] Sum;
output Cout;
 
wire [3:0] Pr,Ge,Carry;
assign Ge=in1&in2; //Generator

assign Pr=in1^in2;//Propagattor
 
   assign Carry[0] = Cin;
    assign Carry[1] = (Ge[0]) |(Pr[0] & Carry[0]);
    assign Carry[2] = (Ge[1]) | (Pr[1] & Ge[0]) | (Pr[1] & Pr[0] & Carry[0]);
    assign Carry[3] = (Ge[2]) | (Pr[2] & Ge[1]) | (Pr[2] & Pr[1] & Ge[0]) |(Pr[2] & Pr[1] & Pr[0] & Carry[0]);
    assign Cout = (Ge[3]) | (Pr[3] & Ge[2]) | (Pr[3] & Pr[2] & Ge[1]) | 
	 (Pr[3] & Pr[2] & Pr[1] & Ge[0]) |(Pr[3] & Pr[2] & Pr[1] & Pr[0] & Carry[0]);
    assign Sum = Pr ^ Carry;
 
endmodule


module CLA_16(in1,in2, Cin, Sum,Cout);
input [15:0] in1,in2;
input Cin;
output [15:0] Sum;
output Cout;
wire C1,C2,C3;
 
CLA_4 carry_lha1 (.in1(in1[3:0]), .in2(in2[3:0]), .Cin(Cin), .Sum(Sum[3:0]), .Cout(C1));
CLA_4 carry_lha2 (.in1(in1[7:4]), .in2(in2[7:4]), .Cin(C1), .Sum(Sum[7:4]), .Cout(C2));
CLA_4 carry_1ha3(.in1(in1[11:8]), .in2(in2[11:8]), .Cin(C2), .Sum(Sum[11:8]), .Cout(C3));
CLA_4 carry_1ha4(.in1(in1[15:12]), .in2(in2[15:12]), .Cin(C3), .Sum(Sum[15:12]), .Cout(Cout));
 
endmodule
 
