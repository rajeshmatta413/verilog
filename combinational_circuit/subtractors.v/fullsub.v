///FULL SUBTRACTOR - Complete Implementation
/// Full subtractor performs subtraction of three 1-bit numbers (a, b, borrow_in)
/// Generates difference and borrow_out outputs
/// This is the fundamental building block for multi-bit subtractors used in ALUs
/// Real-world applications: CPU arithmetic units, digital signal processing, calculators

module fs(a,b,c,d,ba);
  // Input ports: Three 1-bit inputs for subtraction
  input wire a;               // Minuend (number to be subtracted from)
  input wire b;               // Subtrahend (number to be subtracted)
  input wire c;               // Borrow input from previous stage
  
  // Output ports: Difference and borrow output
  output reg d;               // Difference output (a - b - c)
  output reg ba;              // Borrow output (borrow needed for this stage)
  
  // Combinational logic: Calculate difference and borrow using Boolean expressions
  always@(*)                  // Executes whenever inputs change
    begin
      d = c^a^b;             // Difference = c XOR a XOR b (same as full adder sum)
      ba = !a&c | !a&b | b&c; // Borrow = (!a AND c) OR (!a AND b) OR (b AND c)
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
