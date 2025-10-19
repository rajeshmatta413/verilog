///PALINDROME CHECKER - Complete Implementation
/// Checks if a 4-bit number reads the same forwards and backwards
/// Palindrome: A sequence that remains unchanged when reversed
/// Real-world applications: Data validation, error detection, pattern recognition

module pal(a,b);
  // Input port: 4-bit number to be checked for palindrome property
  input wire [3:0]a;          // 4-bit input (a[3] is MSB, a[0] is LSB)
  
  // Output port: Palindrome detection result
  output reg b;               // Output: 1 if palindrome, 0 if not palindrome
  
  // Combinational logic: Check if input is palindrome by comparing symmetric bits
  always@(*)                  // Executes whenever input changes
    begin
      if(a[0]==a[3] && a[1]==a[2])  // Check if LSB=MSB AND middle bits are equal
        b = 1'b1;            // Set output to 1 if palindrome detected
      else                    // If symmetric bits don't match
        b = 1'b0;            // Set output to 0 (not a palindrome)
    end
endmodule






///TEST BENCH:-
module tb;
  reg [3:0]a;
  wire b;
  pal dut(.a(a),.b(b));
  initial
    begin
      $monitor($time,"a=%0b,b=%0b",a,b);
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b0; a[3]=1'b1;
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b0; a[3]=1'b0;
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b1; a[3]=1'b0;
      #5 a[0]=1'b0; a[1]=1'b1; a[2]=1'b1; a[3]=1'b1;
      #5 a[0]=1'b1; a[1]=1'b0; a[2]=1'b0; a[3]=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
