module round_robin_arbiter(input clk, rst_n, [3:0]req, output reg [3:0] gnt);
reg [2:0]present_state;
reg [2:0]nextstate;
parameter [2:0] s_ideal =3'b000;
parameter [2:0] s_0 =3'b001;
parameter [2:0] s_1 =3'b010;
parameter [2:0] s_2 =3'b011;
parameter [2:0] s_3 =3'b100;
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        present_state <=s_ideal;
    else
        present_state <= nextstate;
end
always @(*)
begin 
    case(present_state)
    s_ideal : begin
        if(req[0])
            begin
                nextstate = s_0;
            end
        else if(req[1])
            begin 
                nextstate = s_1;
            end
        else if(req[2])
            begin 
                nextstate = s_2;
            end
        else if(req[3])
            begin 
                nextstate = s_3;
            end
        else
            begin 
                nextstate = s_ideal;
            end
        end
    s_0 : begin 
        if(req[1])
            begin
                nextstate = s_1;
            end
        else if(req[2])
            begin 
                nextstate = s_2;
            end
        else if(req[3])
            begin 
                nextstate = s_3;
            end
        else if(req[0])
            begin 
                nextstate = s_0;
            end
        else
            begin 
                nextstate = s_ideal;
            end
        end
    s_1 : begin 
        if(req[2])
            begin
                nextstate = s_2;
            end
        else if(req[3])
            begin 
                nextstate = s_3;
            end
        else if(req[0])
            begin 
                nextstate = s_0;
            end
        else if(req[1])
            begin 
                nextstate = s_1;
            end
        else
            begin 
                nextstate = s_ideal;
            end
        end
    s_2 : begin 
        if(req[3])
            begin
                nextstate = s_3;
            end
        else if(req[0])
            begin 
                nextstate = s_0;
            end
        else if(req[1])
            begin 
                nextstate = s_1;
            end
        else if(req[2])
            begin 
                nextstate = s_2;
            end
        else
            begin 
                nextstate = s_ideal;
            end
        end
    s_3 : begin 
        if(req[0])
            begin
                nextstate = s_1;
            end
        else if(req[1])
            begin 
                nextstate = s_2;
            end
        else if(req[2])
            begin 
                nextstate = s_3;
            end
        else if(req[3])
            begin 
                nextstate = s_3;
            end
        else
            begin 
                nextstate = s_ideal;
            end
        end  
   endcase
end 
always @(*)
    begin
        case(present_state)
            s_0 : begin gnt=4'b0001; end
            s_1 : begin gnt=4'b0010; end
            s_2 : begin gnt=4'b0100; end
            s_3 : begin gnt=4'b1000; end
            default : begin gnt=4'b0000; end
        endcase
    end 
endmodule
