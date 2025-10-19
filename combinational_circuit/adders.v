///FULL ADDER - Complete Implementation
/// A full adder adds three 1-bit inputs (a, b, carry_in) and produces sum and carry_out
/// This is the fundamental building block for multi-bit adders used in CPUs and ALUs
module full_adder(a,b,c,sum,carry);
  // Input ports: Three 1-bit inputs for addition
  input wire a,b,c;  // a and b are operands, c is carry input from previous stage
  
  // Output ports: Sum and carry output
  output reg sum,carry;  // sum is the result, carry is propagated to next stage
  
  // Alternative gate-level implementation (commented out)
  /*xor x1(w1,a,b);      // First XOR: w1 = a XOR b
  xor x2(sum,c,w1);     // Second XOR: sum = c XOR w1 = a XOR b XOR c
  and a1(w2,a,b);       // First AND: w2 = a AND b
  and a2(w3,b,c);       // Second AND: w3 = b AND c  
  and a3(w4,a,c);       // Third AND: w4 = a AND c
  or o1(carry,w2,w3,w4); // OR gate: carry = w2 OR w3 OR w4*/
  
  // Continuous assignment implementation (current active)
  assign sum = a^b^c;           // Sum = a XOR b XOR c (XOR of all three inputs)
  assign carry = a&b|b&c|a&c;   // Carry = (a AND b) OR (b AND c) OR (a AND c)
  
  // Alternative procedural implementation (commented out)
  /*always@(*)  // Combinational block
    begin
    sum = a^b^c;           // Sum calculation using XOR
    carry = a&b|b&c|a&c;  // Carry calculation using AND/OR gates
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
