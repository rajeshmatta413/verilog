

///D LATCH - Complete Implementation
/// D latch is a level-sensitive memory element (transparent when enabled)
/// Unlike flip-flops, latches are transparent during enable period
/// Real-world applications: Data capture, temporary storage, transparent registers

module dlatch(d,en,q,qb);
  // Input ports: Data and enable signals
  input wire d;               // Data input to be stored
  input wire en;              // Enable signal (active high)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Combinational logic: Transparent latch operation
  always@(en or d)            // Executes when enable or data changes
    begin
      if(en)                  // If enable is active
        q <= d;               // Data passes through (transparent)
      // If enable is inactive, Q holds previous value (latched)
    end
  assign qb = ~q;             // Q-bar is always complement of Q
endmodule



///TESTBENCH:

module tb;
  reg d,en;
  wire q,qb;
  
  dlatch dut(.d(d),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"d=%0b,en=%0b,q=%0b,qb=%0b",d,en,q,qb);
      #0 en=1'b0;
      #0 d=1'b0;
      
      #5 en=1'b1;
      #5 d=1'b0;
      #5 d=1'b1;
      
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

