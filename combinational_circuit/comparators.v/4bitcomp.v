///4-BIT COMPARATOR - Complete Implementation
/// Compares two 4-bit numbers and determines their relationship
/// Generates three outputs: equal, less than, and greater than
/// Real-world applications: CPU instruction comparison, memory addressing, data validation

module bit4comparator(a,b,y0,y1,y2);
  // Input ports: Two 4-bit numbers to be compared
  input wire [3:0]a;          // First 4-bit input (a[3] is MSB, a[0] is LSB)
  input wire [3:0]b;          // Second 4-bit input (b[3] is MSB, b[0] is LSB)
  
  // Output ports: Comparison results
  output reg y0;              // Equal output (a == b)
  output reg y1;              // Less than output (a < b)
  output reg y2;              // Greater than output (a > b)
  
  // Combinational logic: Compare 4-bit inputs and generate appropriate outputs
  always@(*)                  // Executes whenever inputs change
    begin
      y0 = (a==b);           // Set y0 to 1 if a equals b
      y1 = (a<b);             // Set y1 to 1 if a is less than b
      y2 = (a>b);             // Set y2 to 1 if a is greater than b
    end
endmodule


///TESTBENCH:-
module tb;
  reg [3:0]a,b;
  wire y0,y1,y2;
  bit4comparator dut(.a(a),.b(b),.y0(y0),.y1(y1),.y2(y2));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b,y0=%0b,y1=%0b,y2=%0b",a,b,y0,y1,y2);
      #2 a=4'b0010; b=4'b0011;
      #4 a=4'b0001; b=4'b0000;
      #6 a=4'b0100; b=4'b0100;
      #8 a=4'b1100; b=4'b1101;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
