///PALAIN DROME CHECKER:-

module pal(a,b);
  input wire [3:0]a;
  output reg b;
  
  always@(*)
    begin
      if(a[0]==a[3] && a[1]==a[2])
        b=1'b1;
      else
        b=1'b0;
    end
endmodule






///TEST BENCH:-
module tb;
  reg [3:0]a;
  wire b;
  pal dut(.a(a),.b(b));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b",a,b);
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b0; a[3]=1'b1;
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b0; a[3]=1'b0;
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b1; a[3]=1'b0;
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b1; a[3]=1'b1;
      #5 a[0]=1'b1; a[1]=1'b0; a[2]=1'b0; a[3]=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
