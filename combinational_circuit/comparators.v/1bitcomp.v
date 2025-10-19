///1-BIT COMPARATOR - Complete Implementation
/// Compares two 1-bit numbers and determines their relationship
/// Generates three outputs: equal, less than, and greater than
/// Real-world applications: Control logic, decision making, sorting algorithms

module comparator(a,b,y0,y1,y2);
  // Input ports: Two 1-bit numbers to be compared
  input wire a;               // First 1-bit input
  input wire b;               // Second 1-bit input
  
  // Output ports: Comparison results
  output reg y0;              // Equal output (a == b)
  output reg y1;              // Less than output (a < b)
  output reg y2;              // Greater than output (a > b)
  
  // Combinational logic: Compare inputs and generate appropriate outputs
  always@(*)                  // Executes whenever inputs change
    begin
      y0 = (a==b);           // Set y0 to 1 if a equals b
      y1 = (a<b);             // Set y1 to 1 if a is less than b
      y2 = (a>b);             // Set y2 to 1 if a is greater than b
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
