module fixed_priority_arbiter_testbench;
reg clk;
reg rst_n;
reg [3:0]req;
wire [3:0]gnt;
fixed_priority_arbiter dut(clk, rst_n, req, gnt);
always #5 clk=~clk;
initial begin 
    clk=0;
    rst_n=0;
    req=4'b0;
    
    #5 rst_n = 1;
    @(negedge clk) req = 4'b1000;
    @(negedge clk) req = 4'b1010;
    @(negedge clk) req = 4'b1100;
    @(negedge clk) req = 4'b0101;
    @(negedge clk) req = 4'b1110;
    @(negedge clk) req = 4'b0011;
    @(negedge clk) req = 4'b0111;
    @(negedge clk) req = 4'b0010;
    #5 rst_n = 0;
    #100 $finish;
end
endmodule
