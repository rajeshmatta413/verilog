///FSM MELAY:-
module melay_1011(clk,reset,din,dout);
  input wire clk,reset,din;
  output reg dout;
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
  parameter s3=2'b11;
  reg [1:0] state;
  always@(posedge clk or negedge reset)
    begin
      
    if(!reset)
      begin
        state<=s0;
        dout<=1'b0;
      end
  else
    begin
      case({state})
        
        s0:if(din)
          begin
          state<=s1;
          dout<=1'b0;
        end
        else
          begin
            state<=s0;
          end
        
          s1:if(din)
            begin
              state<=s2;
              dout<=1'b0;
            end
        else
          begin
            state<=s1;
          end
        
          s2:if(din)
            begin
              state<=s3;
              dout<=1'b0;
            end
        else
          begin
            state<=s2;
          end
        
          s3:if(din)
            begin
              state<=s1;
              dout<=1'b1;
            end
        else
          begin
            state<=s0;
          end
        
      endcase
    end
    end
endmodule

///TESTBENCH:-

module tb;
  reg clk,reset,din;
  wire dout;
  always #2 clk=~clk;
  melay_1011 dut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,din=%0b,dout=%0b",clk,reset,din,dout);
      #0 clk=1'b0;
      reset=1'b0;
      din=1'b0;
      #5 clk=1'b1;
      #5 reset=1'b1;
      #5 din=1'b1;
      #5 din=1'b0;
      #5 din=1'b1;
      #5 din=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
