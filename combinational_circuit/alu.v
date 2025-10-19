///ALU:-
module alu(a,b,ad,s,m,d,o,an,x,xn);
  input wire [3:0]a,b;
  output reg [3:0]ad,s,m,d,o,an,x,xn;
  
  always@(*)
    begin
      ad=a+b;
      s=a-b;
      m=a*b;
      d=a/b;
      o=a|b;
      an=a&b;
      x=a^b;
      xn=a~^b;
    end
endmodule



///TEST BENCH:-
module tb;
  reg [3:0]a,b;
  wire [3:0]ad,s,m,d,o,an,x,xn;
  
  alu dut(.a(a),.b(b),.ad(ad),.s(s),.m(m),.d(d),.o(0),.an(an),.x(x),.xn(xn));
  initial
    begin     $monitor($time,"a=%0d,b=%d,ad=%0d,s=%0d,m=%0d,d=%0d,o=%0d,an=%0d,x=%0d,xn=%0d",a,b,ad,s,m,d,o,an,x,xn);
      #5 a=4'd10; b=4'd01;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
