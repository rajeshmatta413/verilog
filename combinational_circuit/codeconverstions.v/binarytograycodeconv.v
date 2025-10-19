///BINARY TO GRAY CODE CONVERSION - Complete Implementation
/// Gray code is a binary numeral system where two consecutive values differ by only one bit
/// This eliminates ambiguity in digital systems and reduces errors in counting/positioning
/// Real-world applications: Rotary encoders, analog-to-digital converters, error correction

module btog(b,g);
  // Input port: 4-bit binary number to be converted
  input wire [3:0]b;          // Binary input (b[3] is MSB, b[0] is LSB)
  
  // Output port: 4-bit Gray code equivalent
  output reg [3:0]g;          // Gray code output (g[3] is MSB, g[0] is LSB)
  
  // Combinational logic: Convert binary to Gray code using XOR operations
  always@(*)                  // Executes whenever input changes
    begin
      g[0] = b[0];            // LSB remains unchanged in Gray code
      g[1] = b[0]^b[1];       // XOR of b[0] and b[1] (adjacent bits)
      g[2] = b[1]^b[2];       // XOR of b[1] and b[2] (adjacent bits)
      g[3] = b[2]^b[3];       // XOR of b[2] and b[3] (adjacent bits)
    end
endmodule






///TEST BENCH:-
module tb;
  reg [3:0]b;
  wire [3:0]g;
  
  btog dut(.b(b),.g(g));
  initial
    begin
      $monitor($time,"b=%0b,g=%0b",b,g);
      #5 b[0]=1'b0; b[1]=1'b1; b[2]=1'b1; b[3]=1'b0;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
