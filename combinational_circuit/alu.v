///ALU (Arithmetic Logic Unit) - Complete Implementation
/// This module implements a comprehensive ALU that performs various arithmetic and logical operations
/// ALU is the core processing unit in CPUs, performing all mathematical and logical computations
module alu(a,b,ad,s,m,d,o,an,x,xn);
  // Input ports: Two 4-bit operands for ALU operations
  input wire [3:0]a,b;  // 4-bit input operands (a and b)
  
  // Output ports: Results of different ALU operations
  output reg [3:0]ad,s,m,d,o,an,x,xn;  // All outputs are 4-bit registers
  
  // Combinational logic block - executes whenever inputs change
  always@(*)  // Sensitivity list: executes on any input change
    begin
      // ARITHMETIC OPERATIONS
      ad = a + b;        // Addition: Sum of two operands (used in CPU add instructions)
      s = a - b;         // Subtraction: Difference of two operands (used in CPU sub instructions)
      m = a * b;         // Multiplication: Product of two operands (used in CPU mul instructions)
      d = a / b;         // Division: Quotient of two operands (used in CPU div instructions)
      
      // LOGICAL OPERATIONS
      o = a | b;         // Bitwise OR: Each bit position ORed (used in logical OR operations)
      an = a & b;        // Bitwise AND: Each bit position ANDed (used in logical AND operations)
      x = a ^ b;         // Bitwise XOR: Each bit position XORed (used in parity, encryption)
      xn = a ~^ b;       // Bitwise XNOR: Inverted XOR (used in equivalence checking)
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
