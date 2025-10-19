///BINARY TO GRAY CODE CONVERSION:-
module btog(b,g);
  input wire [3:0]b;
  output reg [3:0]g;
  
  always@(*)
    begin
      g[0]=b[0];
      g[1]=b[0]^b[1];
      g[2]=b[1]^b[2];
      g[3]=b[2]^b[3];
    end
endmodule






///TEST BENCH:-
module tb;
  reg [3:0]b;
  wire [3:0]g;
  
  btog dut(.b(b),.g(g));
  initial
    begin
      $monitor($time,"b=%0b,g=%0b",b,g);
      #5 b[0]=1'b0; b[1]=1'b1; b[2]=1'b1; b[3]=1'b0;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
