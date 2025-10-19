
///VERILOG OPERATORS - Complete Reference Implementation
/// This module demonstrates all major Verilog operators with practical examples
/// Understanding operators is crucial for writing efficient hardware descriptions

module operators(a,b,m,y,s,mo,d,g,l,ge,le,eq,neq,ca_eq,ca_neq,logic_and,logic_not,bit_and,sh_r);
  // Input ports: Two 4-bit operands for operator demonstrations
  input wire [3:0]a;  // First 4-bit operand
  input wire [3:0]b;  // Second 4-bit operand
  
  // Output ports: Results of different operator types
  output reg [4:0]m;        // Multiplication result (5-bit to handle overflow)
  output reg [4:0]y;        // Addition result (5-bit to handle carry)
  output reg [4:0]s;        // Subtraction result (5-bit to handle borrow)
  output reg [4:0]mo;       // Modulo result (5-bit)
  output reg [4:0]d;        // Division result (5-bit)
  output reg g;             // Greater than comparison result
  output reg l;             // Less than comparison result
  output reg ge;            // Greater or equal comparison result
  output reg le;            // Less or equal comparison result
  output reg eq;            // Equality comparison result
  output reg neq;           // Not equal comparison result
  output reg ca_eq;         // Case equality comparison result
  output reg ca_neq;        // Case not equal comparison result
  output reg logic_and;     // Logical AND result
  output reg logic_not;     // Logical NOT result
  output reg bit_and;       // Bitwise AND result
  output reg sh_r;          // Right shift result
  
  // 1. ARITHMETIC OPERATORS - Mathematical operations
  assign m = a * b;         // Multiplication: Used in DSP, graphics processors
  assign y = a + b;         // Addition: Most common operation in ALUs
  assign s = a - b;         // Subtraction: Used in ALUs, comparators
  //assign mo = a %% b;     // Modulo: Commented out (syntax error - should be %)
  assign d = a / b;         // Division: Rare in hardware due to complexity
  
  // 2. RELATIONAL OPERATORS - Comparison operations (return 1-bit result)
  assign g = a > b;         // Greater than: Used in control logic, sorting
  assign l = a < b;         // Less than: Used in range checking, comparators
  assign ge = a >= b;       // Greater or equal: Used in threshold detection
  assign le = a <= b;       // Less or equal: Used in limit checking
  
  // 3. EQUALITY OPERATORS - Equality checking
  assign eq = a == b;       // Logical equality: Ignores X and Z values
  assign neq = a != b;      // Logical inequality: Ignores X and Z values
  assign ca_eq = a === b;   // Case equality: Includes X and Z values (simulation only)
  assign ca_neq = a !== b;  // Case inequality: Includes X and Z values (simulation only)
  
  // 4. LOGICAL OPERATORS - Boolean logic operations
  assign logic_and = (b<a)&&(a>b);  // Logical AND: Combines relational results
  assign logic_not = !(b>a);        // Logical NOT: Inverts boolean result
  
  // 5. BITWISE OPERATORS - Bit-level operations
  assign bit_and = a & b;   // Bitwise AND: Each bit position ANDed independently
  
  // 6. SHIFT OPERATORS - Bit shifting operations
  assign sh_r = a >> 1;     // Right shift: Divides by 2, used in barrel shifters
endmodule
  










///TESTBENCH:-
module tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [4:0]m;
  wire [4:0]y;
  wire [4:0]s;
  wire [4:0]mo;
  wire [4:0]d;
  wire g;
  wire l;
  wire ge;
  wire le;
  wire eq;
  wire neq;
  wire ca_eq;
  wire ca_neq;
  wire logic_and;
  wire logic_not;
  wire bit_and;
  wire sh_r;
  
  operators dut(.a(a),.b(b),.m(m),.y(y),.s(s),.mo(mo),.d(d),.g(g),.l(l),.ge(ge),.le(le),.eq(eq),.neq(neq),.ca_eq(ca_eq),.ca_neq(ca_neq),.logic_and(logic_and),.logic_not(logic_not),.bit_and(bit_and),.sh_r(sh_r));
  initial
    begin
      //1 arithmetic operators
      #10 a=4'b1000; b=4'b0001;
      $display("Multiplication : %b * %b = %b",a,b,m);
      #10 a=4'b1000; b=4'b1100;
      $display("Addition : %b + %b = %b",a,b,y);
      #10 a=4'b1000; b=4'b0001;
      $display("Subtraction : %b - %b = %b",a,b,s);
      //#10 a=4'b1000; b=4'b0001;
     // $display("Modulus : %b %% %b = %b",a,b,mo);
      #10 a=4'b1000; b=4'b0001;
      $display("division : %b / %b = %b",a,b,d);
      //2 relational operators
       #10 a=4'b1000; b=4'b0001;
      $display("greaterthan : %b > %b = %b",a,b,g);
       #10 a=4'b1000; b=4'b0001;
      $display("lessthan : %b < %b = %b",a,b,l);
       #10 a=4'b1000; b=4'b0001;
      $display("greater or equal : %b >= %b = %b",a,b,ge);
       #10 a=4'b1000; b=4'b0001;
      $display("less or equal : %b <= %b = %b",a,b,le);
      //3 equal operators
      #10 a=4'b1000; b=4'b0001;
      $display("equal : %b == %b = %b",a,b,eq);
       #10 a=4'b1000; b=4'b0001;
      $display("notequal : %b != %b = %b",a,b,neq);
       #10 a=4'b1000; b=4'b0001;
      $display("case equal : %b === %b = %b",a,b,ca_eq);
       #10 a=4'b1000; b=4'b0001;
      $display("case notequal : %b !== %b = %b",a,b,ca_neq);
      //logical operators
      #10 a=4'b1000; b=4'b0001;
      $display("logic_and : %b && %b = %b",a,b,logic_and);
      #10 a=4'b1000;b=4'b0001;
      $display("logic_not : %b ! %b = %b",a,b,logic_not);
      //bitwise operators
      #10 a=4'b1000; b=4'b0001;
      $display("bit_and : %b & %b = %b",a,b,bit_and);
      //shift operators
      #10 a=4'b1000;
      $display("shi_r : %b >> 1 = %b",a,sh_r); 
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
