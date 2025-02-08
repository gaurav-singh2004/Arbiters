module round_robin_arbiters_variable_time_slicing(input clk, input rst_n, input [3:0] REQ, output reg [3:0] GNT);
reg [1:0] count;
reg [3:0] present_state;
reg [3:0] next_state;
parameter [3:0] s_ideal = 4'b0000;
parameter [3:0] s_0 = 4'b0001;
parameter [3:0] s_1 = 4'b0010;
parameter [3:0] s_2 = 4'b0011;
parameter [3:0] s_3 = 4'b0100;

always @(posedge clk or negedge rst_n) begin 
if (!rst_n) begin
  present_state <= s_ideal;
end else begin
  present_state <= next_state;
end
end 

always @(present_state or REQ) begin 
case (present_state)
  s_ideal: begin 
    count = 2'b00;
    if (REQ[0]) begin
      next_state = s_0;
    end 
    else if (REQ[1]) begin
      next_state = s_1;
    end 
    else if (REQ[2]) begin
      next_state = s_2;
    end 
    else if (REQ[3]) begin
      next_state = s_3;
    end 
    else begin
      next_state = s_ideal;
    end
  end
  
  s_0: begin
    if (REQ[0]) begin 
      if (count == 2'b10) begin
        if (REQ[1]) begin
          next_state = s_1;
        end 
        else if (REQ[2]) begin
          next_state = s_2;
        end 
        else if (REQ[3]) begin
          next_state = s_3;
        end 
        else begin
          next_state = s_0;
        end
        count = 2'b00;
      end 
      else begin
        count = count + 1'b1;
        next_state = s_0;
      end 
    end 
    else if (REQ[1]) begin
      next_state = s_1;
    end 
    else if (REQ[2]) begin
      next_state = s_2;
    end 
    else if (REQ[3]) begin
      next_state = s_3;
    end 
    else begin
      next_state = s_ideal;
    end
  end
  
  s_1: begin
    if (REQ[1]) begin 
      if (count == 2'b10) begin
        if (REQ[2]) begin
          next_state = s_2;
        end 
        else if (REQ[3]) begin
          next_state = s_3;
        end 
        else if (REQ[0]) begin
          next_state = s_0;
        end 
        else begin
          next_state = s_1;
        end
        count = 2'b00;
      end 
      else begin
        count = count + 1'b1;
        next_state = s_1;
      end 
    end 
    else if (REQ[2]) begin
      next_state = s_2;
    end 
    else if (REQ[3]) begin
      next_state = s_3;
    end 
    else if (REQ[0]) begin
      next_state = s_0;
    end 
    else begin
      next_state = s_ideal;
    end
  end
  
  s_2: begin
    if (REQ[2]) begin 
      if (count == 2'b10) begin
        if (REQ[3]) begin
          next_state = s_3;
        end 
        else if (REQ[0]) begin
          next_state = s_0;
        end 
        else if (REQ[1]) begin
          next_state = s_1;
        end 
        else begin
          next_state = s_2;
        end
        count = 2'b00;
      end 
      else begin
        count = count + 1'b1;
        next_state = s_2;
      end 
    end 
    else if (REQ[3]) begin
      next_state = s_3;
    end 
    else if (REQ[0]) begin
      next_state = s_0;
    end 
    else if (REQ[1]) begin
      next_state = s_1;
    end 
    else begin
      next_state = s_ideal;
    end
  end
  
  s_3: begin
    if (REQ[3]) begin 
      if (count == 2'b10) begin
        if (REQ[0]) begin
          next_state = s_0;
        end 
        else if (REQ[1]) begin
          next_state = s_1;
        end 
        else if (REQ[2]) begin
          next_state = s_2;
        end 
        else begin
          next_state = s_3;
        end
        count = 2'b00;
      end 
      else begin
        count = count + 1'b1;
        next_state = s_3;
      end 
    end 
    else if (REQ[0]) begin
      next_state = s_0;
    end 
    else if (REQ[1]) begin
      next_state = s_1;
    end 
    else if (REQ[2]) begin
      next_state = s_2;
    end 
    else begin
      next_state = s_ideal;
    end
  end
endcase
end 

always @(posedge clk or negedge rst_n) begin
if (!rst_n) begin
  GNT <= 4'b0000;
end else begin
  case (present_state)        
    s_0: GNT <= 4'b0001;
    s_1: GNT <= 4'b0010;
    s_2: GNT <= 4'b0100;
    s_3: GNT <= 4'b1000;
    default: GNT <= 4'b0000;
  endcase
end
end 
endmodule
