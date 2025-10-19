///MEALY STATE MACHINE - Pattern Detector for "1011"
/// Mealy machines: Output depends on both current state AND current input
/// This FSM detects the sequence "1011" in a serial data stream
/// Real-world applications: Protocol detection, error checking, pattern recognition

module melay_1011(clk,reset,din,dout);
  // Input ports: Control and data signals
  input wire clk;              // Clock signal for synchronous operation
  input wire reset;             // Reset signal (active low)
  input wire din;              // Serial data input (1-bit)
  
  // Output port: Detection result
  output reg dout;             // Output: 1 when pattern "1011" is detected
  
  // State definitions: Each state represents progress in pattern detection
  parameter s0 = 2'b00;        // State 0: No pattern detected yet
  parameter s1 = 2'b01;        // State 1: Detected "1"
  parameter s2 = 2'b10;        // State 2: Detected "10"
  parameter s3 = 2'b11;        // State 3: Detected "101"
  
  // State register: Holds current state
  reg [1:0] state;             // 2-bit state register (can hold 4 states)
  
  // Sequential logic: State transitions on clock edge
  always@(posedge clk or negedge reset)  // Triggered by clock or reset
    begin
      // RESET LOGIC: Initialize to starting state
      if(!reset)               // Active low reset
        begin
          state <= s0;         // Go to initial state
          dout <= 1'b0;        // Clear output
        end
      else
        begin
          // STATE MACHINE LOGIC: Determine next state and output based on current state and input
          case(state)          // Check current state
            s0: if(din)        // In state 0: if input is '1'
              begin
                state <= s1;   // Move to state 1 (detected "1")
                dout <= 1'b0;  // Output remains 0
              end
            else               // If input is '0'
              begin
                state <= s0;   // Stay in state 0
              end
              
            s1: if(din)        // In state 1: if input is '1'
              begin
                state <= s2;   // Move to state 2 (detected "11")
                dout <= 1'b0;  // Output remains 0
              end
            else               // If input is '0'
              begin
                state <= s1;   // Stay in state 1
              end
              
            s2: if(din)        // In state 2: if input is '1'
              begin
                state <= s3;   // Move to state 3 (detected "111")
                dout <= 1'b0;  // Output remains 0
              end
            else               // If input is '0'
              begin
                state <= s2;   // Stay in state 2
              end
              
            s3: if(din)        // In state 3: if input is '1'
              begin
                state <= s1;   // Move to state 1 (overlapping detection)
                dout <= 1'b1;  // Output becomes 1 (pattern detected!)
              end
            else               // If input is '0'
              begin
                state <= s0;   // Reset to state 0
              end
          endcase
        end
    end
endmodule

///TESTBENCH:-

module tb;
  reg clk,reset,din;
  wire dout;
  always #2 clk=~clk;
  melay_1011 dut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,din=%0b,dout=%0b",clk,reset,din,dout);
      #0 clk=1'b0;
      reset=1'b0;
      din=1'b0;
      #5 clk=1'b1;
      #5 reset=1'b1;
      #5 din=1'b1;
      #5 din=1'b0;
      #5 din=1'b1;
      #5 din=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
