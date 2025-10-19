///FULL SUBTRACTOR:-
module fs(a,b,c,d,ba);
  input wire a,b,c;
  output reg d,ba;
  
  always@(*)
    begin
      d= c^a^b;
      ba= !a&c | !a&b | b&c;
    end
endmodule

///TEST BENCH:-
module tb;
  reg a,b,c;
  wire d,ba;
  
  fs(.a(a),.b(b),.c(c),.d(d),.ba(ba));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,c=%0b,d=%0b,ba=%0b",a,b,c,d,ba);
      #5 a=1'b0; b=1'b0; c=1'b0;
      #5 a=1'b0; b=1'b0; c=1'b1;
      #5 a=1'b0; b=1'b1; c=1'b0;
      #5 a=1'b0; b=1'b1; c=1'b1;
      #5 a=1'b1; b=1'b0; c=1'b0;
      #5 a=1'b1; b=1'b0; c=1'b1;
      #5 a=1'b1; b=1'b1; c=1'b0;
      #5 a=1'b1; b=1'b1; c=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
