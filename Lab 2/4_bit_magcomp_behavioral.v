//solution to Problem 3

module Problem_3(output reg greater, less, equal, input [3:0] A, B);

always@(A or B) begin

if(A > B) begin
	greater = 1'b1;
	less = 1'b0;
	equal = 1'b0;
end

else if(A < B) begin
	greater = 1'b0;
	less = 1'b1;
	equal = 1'b0;
end

else if(A == B) begin
	greater = 1'b0;
	less = 1'b0;
	equal = 1'b1;
end
end

endmodule




module t_Problem_3; //Tests
wire t_greater, t_less, t_equal;
reg [3:0] t_A, t_B;
Problem_3 P(t_greater, t_less, t_equal, t_A, t_B);

initial #200 $finish //end program after 200 time units

initial begin
	$monitor("A = %b, B = %b, Greater = %b, Less = %b, Equal = %b", t_A, t_B, t_greater, t_less, t_equal);
	t_A = 4'b0001;
	t_B = 4'b0001;
	//More test cases were used, please see table
end
endmodule
