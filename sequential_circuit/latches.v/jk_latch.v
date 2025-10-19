///JK LATCH - Complete Implementation
/// JK latch is a level-sensitive memory element with JK functionality
/// Provides set, reset, hold, and toggle operations when enabled
/// Real-world applications: Level-sensitive control circuits, transparent JK operations

module jklatch(j,k,en,q,qb);
  // Input ports: Control and enable signals
  input wire j;               // J input (set control)
  input wire k;               // K input (reset control)
  input wire en;              // Enable signal (active high)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Combinational logic: JK latch operation when enabled
  always@(en or j or k)       // Executes when enable, J, or K changes
    if(en)                    // If enable is active
      begin
        case({j,k})           // Check J and K inputs
          2'b00: q <= q;      // J=0, K=0: Hold current state
          2'b01: q <= 1'b0;  // J=0, K=1: Reset to 0
          2'b10: q <= 1'b1;  // J=1, K=0: Set to 1
          2'b11: q <= ~q;    // J=1, K=1: Toggle
        endcase
      end
      // If enable is inactive, Q holds previous value (latched)
  assign qb = ~q;             // Q-bar is always complement of Q
endmodule



///TESTBENCH

module tb;
  reg j,k,en;
  wire q,qb;
  
  jklatch dut(.j(j),.k(k),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"j=%0b,k=%0b,en=%0b,q=%0b,qb=%0b",j,k,en,q,qb);
      #0 en=1'b0;
      #0 j=1'b0; k=1'b0;
      
      #5 en=1'b1;
      #5 j=1'b0; k=1'b0;
      #5 j=1'b0; k=1'b1;
      #5 j=1'b1; k=1'b0;
      #5 j=1'b1; k=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
