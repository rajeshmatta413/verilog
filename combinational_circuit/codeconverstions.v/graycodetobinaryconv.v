///GRAY TO BINARY CODE CONVERSION - Complete Implementation
/// Converts Gray code back to standard binary representation
/// Gray code is decoded by XORing each bit with all more significant bits
/// Real-world applications: Decoding rotary encoder positions, digital communication

module gtob(g,b);
  // Input port: 4-bit Gray code to be converted
  input wire [3:0]g;          // Gray code input (g[3] is MSB, g[0] is LSB)
  
  // Output port: 4-bit binary equivalent
  output reg [3:0]b;          // Binary output (b[3] is MSB, b[0] is LSB)
  
  // Combinational logic: Convert Gray code to binary using cascaded XOR operations
  always@(*)                  // Executes whenever input changes
    begin
      b[0] = g[0];            // LSB remains unchanged (same as Gray code)
      b[1] = b[0]^g[1];       // XOR previous binary bit with current Gray bit
      b[2] = b[1]^g[2];       // XOR previous binary bit with current Gray bit
      b[3] = b[2]^g[3];       // XOR previous binary bit with current Gray bit
    end
endmodule







///TEST BENCH:-
module tb;
  reg [3:0]g;
  wire [3:0]b;
  
  gtob dut(.g(g),.b(b));
  initial
    begin
      $monitor($time,"g=%0b,b=%0b",g,b);
      #5 g[0]=1'b0; g[1]=1'b1; g[2]=1'b1; g[3]=1'b0;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
