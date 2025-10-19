///HALF SUBTRACTOR - Complete Implementation
/// Half subtractor performs subtraction of two 1-bit numbers without borrow input
/// Generates difference and borrow outputs
/// Real-world applications: Basic arithmetic units, ALU design, digital calculators

module hs(a,b,d,ba);
  // Input ports: Two 1-bit numbers to be subtracted
  input wire a;               // Minuend (number to be subtracted from)
  input wire b;               // Subtrahend (number to be subtracted)
  
  // Output ports: Difference and borrow
  output reg d;               // Difference output (a - b)
  output reg ba;              // Borrow output (borrow needed for subtraction)
  
  // Combinational logic: Calculate difference and borrow
  always@(*)                  // Executes whenever inputs change
    begin
      d = a^b;                // Difference = a XOR b (same as half adder sum)
      ba = !a&b;              // Borrow = NOT(a) AND b (borrow when a=0, b=1)
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
