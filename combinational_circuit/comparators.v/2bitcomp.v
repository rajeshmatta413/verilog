///2-BIT COMPARATOR:-

module bit2comparator(a,b,y0,y1,y2);
  input wire [1:0]a,b;
  output reg y0,y1,y2;
  always@(*)
    begin
      y0=(a==b);
      y1=(a<b);
      y2=(a>b);
    end
endmodule

///TESTBENCH:-

module tb;
  reg [1:0]a,b;
  wire y0,y1,y2;
  bit2comparator dut(.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,y0=%0b,y1=%0b,y2=%0b",a,b,y0,y1,y2);
      #2 a=2'b00; b=2'b00;
      #4 a=2'b01; b=2'b11;
      #6 a=2'b10; b=2'b01;
      #8 a=2'b10; b=2'b11;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
