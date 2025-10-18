module full_adder(a,b,c,sum,carry);
  input wire a,b,c;
  output reg sum,carry;
  /*xor x1(w1,a,b);
  xor x2(sum,c,w1);
  and a1(w2,a,b);
  and a2(w3,b,c);
  and a3(w4,a,c);
  or o1(carry,w2,w3,w4);*/
  assign sum=a^b^c;
    assign carry=a&b|b&c|a&c;
  /*always@(*)
    begin
    sum=a^b^c;
  carry=a&b|b&c|a&c;
  end*/
endmodule


////TEST BENCH :-

module tb;
  reg a,b,c;
  wire sum,carry;
  full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
  initial
  begin
    $monitor($time,"a=%0b,b=%0b,c=%0b,sum=%0b,carry=%0b",a,b,c,sum,carry);
    #10 a=1'b0;b=1'b0;c=1'b0;
    #10 a=1'b0;b=1'b0;c=1'b1;
    #10 a=1'b0;b=1'b1;c=1'b0;
    #10 a=1'b0;b=1'b1;c=1'b1;
    #10 a=1'b1;b=1'b0;c=1'b0;
    #10 a=1'b1;b=1'b0;c=1'b1;
    #10 a=1'b1;b=1'b1;c=1'b0;
    #10 a=1'b1;b=1'b1;c=1'b1;
  end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
  
endmodule
