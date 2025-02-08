module round_robin_arbiter_test;
reg clk;
reg rst_n;
reg [3:0]req;
wire [3:0]gnt;
round_robin_arbiter dut(clk, rst_n, req, gnt);
always #5 clk=~clk;
initial begin 
    clk=0;
    rst_n=0;
    req=4'b0;
    
    #5 rst_n = 1;
    @(negedge clk) req = 4'b1111;
    @(negedge clk) req = 4'b1111;
    @(negedge clk) req = 4'b1111;
    @(negedge clk) req = 4'b1111;
    @(negedge clk) req = 4'b1111;
    @(negedge clk) req = 4'b1110;
    @(negedge clk) req = 4'b0100;
    @(negedge clk) req = 4'b1010;
    @(negedge clk) req = 4'b0111;
    @(negedge clk) req = 4'b1010;
    @(negedge clk) req = 4'b1110;
    #5 rst_n =0;
    #100 $finish;
end
endmodule