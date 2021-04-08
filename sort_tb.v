module sort_tb;
    reg clk;
    reg  [16-1:0] in1,  in2,  in3,  in4,  in5 , in6 , in7, in8, in9;
    wire [16-1:0] out1, out2, out3, out4, out5 ,out6,out7,out8,out9;

    sort #(.NUM_VALS(9), .SIZE(16)) dut (
        .clk(clk),
        .in ({in1,  in2,  in3,  in4,  in5 , in6 , in7, in8, in9}),
        .out({out1, out2, out3, out4, out5,out6,out7,out8,out9})
    );

    always @(posedge clk) begin
        in1 <= $random;
        in2 <= $random;
        in3 <= $random;
        in4 <= $random;
        in5 <= $random;
		  in6 <= $random;
		  in7 <= $random;
		  in8 <= $random;
		  in9 <= $random;
    end

    always @(posedge clk) begin
        $display("In:  %0d %0d %0d %0d %0d %0d %0d %0d %0d", in1,  in2,  in3,  in4,  in5, in6 , in7, in8, in9);
        $display("Out: %0d %0d %0d %0d %0d %0d %0d %0d %0d", out1, out2, out3, out4, out5,out6,out7,out8,out9);
    end

    initial begin
        #100;
        $finish;
    end

    always begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
endmodule