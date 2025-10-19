///GRAY TO BINARY CODE CONVERSION:-
module gtob(g,b);
  input wire [3:0]g;
  output reg [3:0]b;
  
  always@(*)
    begin
      b[0]=g[0];
      b[1]=b[0]^g[1];
      b[2]=b[1]^g[2];
      b[3]=b[2]^g[3];
    end
endmodule







///TEST BENCH:-
module tb;
  reg [3:0]g;
  wire [3:0]b;
  
  gtob dut(.g(g),.b(b));
  initial
    begin
      $monitor($time,"g=%0b,b=%0b",g,b);
      #5 g[0]=1'b0; g[1]=1'b1; g[2]=1'b1; g[3]=1'b0;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
