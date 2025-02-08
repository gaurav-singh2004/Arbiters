module round_robin_arbiters_variable_time_slicing_test;
reg clk;
reg rst_n;
reg [3:0] REQ;
wire [3:0] GNT;
round_robin_arbiters_variable_time_slicing dut (
.clk(clk), 
.rst_n(rst_n), 
.REQ(REQ), 
.GNT(GNT)
);
always #5 clk = ~clk;
initial begin 
clk = 0;
rst_n = 0;
REQ = 4'b0000;
#3 rst_n = 0; 
#6 rst_n = 1;
@(negedge clk) REQ = 4'b1000;
@(negedge clk) REQ = 4'b1010;
@(negedge clk) REQ = 4'b0010;
@(negedge clk) REQ = 4'b0110;
@(negedge clk) REQ = 4'b1110;
@(negedge clk) REQ = 4'b1111;
@(negedge clk) REQ = 4'b0100;
@(negedge clk) REQ = 4'b0100;
@(negedge clk) REQ = 4'b0001;
@(negedge clk) REQ = 4'b0010;
@(negedge clk) REQ = 4'b1101;
#5 rst_n = 0;
#50 $finish;
end
endmodule
