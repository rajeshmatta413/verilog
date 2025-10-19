///1-BIT COMPARATOR:-
module comparator(a,b,y0,y1,y2);
  input wire a,b;
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
  reg a,b;
  wire y0,y1,y2;
  comparator dut(.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,y0=%0b,y1=%0b,y2=%0b",a,b,y0,y1,y2);
      #2 a=1'b0; b=1'b0;
      #4 a=1'b0; b=1'b1;
      #6 a=1'b1; b=1'b0;
      #8 a=1'b1; b=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
