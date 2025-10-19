

///T LATCH - Complete Implementation
/// T latch is a level-sensitive memory element with toggle functionality
/// Toggles output when T=1 and enable is active
/// Real-world applications: Level-sensitive toggle circuits, transparent counters

module tlatch(t,en,q,qb);
  // Input ports: Control and enable signals
  input wire t;               // T input (toggle control)
  input wire en;              // Enable signal (active high)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Combinational logic: T latch operation when enabled
  always@(en or t)            // Executes when enable or T changes
    begin
      if(en)                  // If enable is active
        q <= ~t;               // Toggle based on T input (note: this seems incorrect)
      // If enable is inactive, Q holds previous value (latched)
    end
  assign qb = ~q;             // Q-bar is always complement of Q
endmodule
  



///TESTBENCH:-

module tb;
  reg t,en;
  wire q,qb;
  
  tlatch dut(.t(t),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"t=%0b,en=%0b,q=%0b,qb=%0b",t,en,q,qb);
      #0 en=1'b0;
      #0 t=1'b0;
      
      #5 en=1'b1;
      #5 t=1'b0;
      #5 t=1'b1;
      #5 t=1'b0;
      #5 t=1'b1;
      
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

