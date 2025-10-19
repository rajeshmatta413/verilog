///4-BIT COMPARATOR:-
module bit4comparator(a,b,y0,y1,y2);
  input wire [3:0]a,b;
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
  reg [3:0]a,b;
  wire y0,y1,y2;
  bit4comparator dut(.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,y0=%0b,y1=%0b,y2=%0b",a,b,y0,y1,y2);
      #2 a=4'b0010; b=4'b0011;
      #4 a=4'b0001; b=4'b0000;
      #6 a=4'b0100; b=4'b0100;
      #8 a=4'b1100; b=4'b1101;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
