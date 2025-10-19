///T FLIP-FLOP - Complete Implementation
/// T flip-flop has one input (T) and toggles output when T=1
/// T=0: Hold current state; T=1: Toggle output
/// Real-world applications: Frequency dividers, toggle circuits, binary counters

module t_flipflop(t,clk,reset,q,qb);
  // Input ports: Control and clock signals
  input wire t;               // T input (toggle control)
  input wire clk;             // Clock signal for synchronization
  input wire reset;           // Reset signal (active low)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Sequential logic: T flip-flop operation on clock edge
  always@(posedge clk or negedge reset)  // Triggered by clock or reset
    begin
      if(!reset)              // Active low reset
        begin
          q <= 1'b0;          // Reset Q to 0
          qb <= 1'b1;          // Reset Q-bar to 1
        end
      else if(t)              // If T input is active
        begin
          q <= ~q;            // Toggle Q
          qb <= ~qb;          // Toggle Q-bar
        end
      // If T=0, Q and Q-bar remain unchanged (hold state)
    end
endmodule
