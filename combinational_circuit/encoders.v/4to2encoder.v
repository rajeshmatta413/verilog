///4 TO 2 ENCODER - Complete Implementation
/// Encoder converts one-hot input to binary output (opposite of decoder)
/// Only one input can be active (high) at a time
/// Real-world applications: Priority encoding, interrupt handling, keyboard scanning

module encoder4to2(a,y);
  // Input port: 4-bit one-hot input (only one bit can be '1')
  input wire [3:0]a;          // One-hot input (a[3] is MSB, a[0] is LSB)
  
  // Output port: 2-bit binary equivalent
  output reg [1:0]y;         // Binary output (y[1] is MSB, y[0] is LSB)
  
  // Combinational logic: Convert one-hot input to binary output
  always@(*)                  // Executes whenever input changes
    begin
      case(a)                 // Check which input is active
        4'b0001: y = 2'b00;   // Input 0 active: Output binary 00
        4'b0010: y = 2'b01;   // Input 1 active: Output binary 01
        4'b0100: y = 2'b10;   // Input 2 active: Output binary 10
        4'b1000: y = 2'b11;   // Input 3 active: Output binary 11
        // Default case: Handle invalid inputs (multiple bits high)
        default: y = 2'bxx;   // Output undefined for invalid inputs
      endcase
    end
endmodule





///TESTBENCH:-

module tb;
  reg [3:0]a;
  wire [1:0]y;
  
  encoder4to2 dut(.a(a),.y(y));
  initial 
    begin
      $monitor($time,"a=%0b,y=%b",a,y);
     #10  a=4'b0001;
     #10  a=4'b0010;
     #10  a=4'b0100;
     #10  a=4'b1000;
    
     
    end
endmodule
