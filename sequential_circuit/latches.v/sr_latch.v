///SR LATCH - Complete Implementation
/// SR latch is a level-sensitive memory element with set/reset functionality
/// Provides set, reset, and hold operations when enabled
/// Real-world applications: Level-sensitive control circuits, transparent SR operations

module srlatch(s,r,en,q,qb);
  // Input ports: Control and enable signals
  input wire s;               // S input (set control)
  input wire r;               // R input (reset control)
  input wire en;              // Enable signal (active high)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Combinational logic: SR latch operation when enabled
  always@(en or s or r)       // Executes when enable, S, or R changes
      if (en)                 // If enable is active
        begin
          case({s,r})         // Check S and R inputs
              2'b00: q <= q;  // S=0, R=0: Hold current state
              2'b01: q <= 1'b0; // S=0, R=1: Reset to 0
              2'b10: q <= 1'b1; // S=1, R=0: Set to 1
              2'b11: q <= 1'bx; // S=1, R=1: Invalid state (undefined)
          endcase
        end
        // If enable is inactive, Q holds previous value (latched)
  assign qb = ~q;             // Q-bar is always complement of Q
endmodule


///TESTBENCH:-

module tb;
  reg s,r,en;
  wire q,qb;
  
  srlatch dut(.s(s),.r(r),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"s=%0b,r=%0b,en=%0b,q=%0b,qb=%0b",s,r,en,q,qb);
      #0 en=1'b0;
      #0 s=1'b0; r=1'b0;
      
     
      #5 en=1'b1;
      #5 s=1'b0; r=1'b0;
      #5 s=1'b0; r=1'b1;
      #5 s=1'b1; r=1'b0;
      #5 s=1'b1; r=1'b1;
    end
endmodule
