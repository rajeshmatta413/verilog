///2-TO-4 DECODER - Complete Implementation
/// Decoder converts binary input to one-hot output (only one output is active)
/// This is essential for address decoding in memory systems and control logic
/// Real-world applications: Memory address decoding, instruction decoding, display controllers

module decoder2to4(a,y);
  // Input port: 2-bit binary input
  input wire [1:0]a;          // 2-bit input (can represent 0,1,2,3)
  
  // Output port: 4-bit one-hot output
  output reg [3:0]y;         // 4-bit output (only one bit is '1' at a time)
  
  // Combinational logic: Converts binary input to one-hot output
  always@(*)                  // Executes whenever input changes
    begin
      case(a)                 // Check input value
        2'b00: y = 4'b0001;   // Input 00: Output bit 0 is '1' (y[0]=1)
        2'b01: y = 4'b0010;   // Input 01: Output bit 1 is '1' (y[1]=1)
        2'b10: y = 4'b0100;   // Input 10: Output bit 2 is '1' (y[2]=1)
        2'b11: y = 4'b1000;   // Input 11: Output bit 3 is '1' (y[3]=1)
      endcase
    end
endmodule




///TESTBENCH:-

module tb;
  reg [1:0]a;
  wire [3:0]y;
  
  decoder2to4 dut(.a(a),.y(y));
  initial 
    begin
      $monitor($time,"a=%0b,y=%b",a,y);
     #10  a=2'b00;
     #10  a=2'b01;
     #10  a=2'b10;
     #10  a=2'b11;
    
      
     
    end
endmodule
