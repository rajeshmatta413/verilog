///HALF SUBTRACTOR:-
module hs(a,b,d,ba);
  input wire a,b;
  output reg d,ba;
  
  always@(*)
    begin
      d= a^b;
      ba= !a&b;
    end
endmodule

///TEST BENCH:-
module tb;
  reg a,b;
  wire d,ba;
  
  hs dut(.a(a),.b(b),.d(d),.ba(ba));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,d=%0b,ba=%0b",a,b,d,ba);
       #5 a=1'b0; b=1'b0;
       #5 a=1'b0; b=1'b1;
       #5 a=1'b1; b=1'b0;
       #5 a=1'b1; b=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
