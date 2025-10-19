///2-BIT COMPARATOR - Complete Implementation
/// Compares two 2-bit numbers and determines their relationship
/// Generates three outputs: equal, less than, and greater than
/// Real-world applications: Address comparison, priority encoding, control systems

module bit2comparator(a,b,y0,y1,y2);
  // Input ports: Two 2-bit numbers to be compared
  input wire [1:0]a;          // First 2-bit input (a[1] is MSB, a[0] is LSB)
  input wire [1:0]b;          // Second 2-bit input (b[1] is MSB, b[0] is LSB)
  
  // Output ports: Comparison results
  output reg y0;              // Equal output (a == b)
  output reg y1;              // Less than output (a < b)
  output reg y2;              // Greater than output (a > b)
  
  // Combinational logic: Compare 2-bit inputs and generate appropriate outputs
  always@(*)                  // Executes whenever inputs change
    begin
      y0 = (a==b);           // Set y0 to 1 if a equals b
      y1 = (a<b);             // Set y1 to 1 if a is less than b
      y2 = (a>b);             // Set y2 to 1 if a is greater than b
    end
endmodule

///TESTBENCH:-

module tb;
  reg [1:0]a,b;
  wire y0,y1,y2;
  bit2comparator dut(.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,y0=%0b,y1=%0b,y2=%0b",a,b,y0,y1,y2);
      #2 a=2'b00; b=2'b00;
      #4 a=2'b01; b=2'b11;
      #6 a=2'b10; b=2'b01;
      #8 a=2'b10; b=2'b11;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
