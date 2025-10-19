///JK FLIP-FLOP - Complete Implementation
/// JK flip-flop has two inputs (J, K) and provides toggle functionality
/// J=1, K=0: Set output to 1; J=0, K=1: Set output to 0; J=K=1: Toggle
/// Real-world applications: Frequency dividers, toggle circuits, state machines

module jk_flipflop(j,k,clk,reset,q,qb);
  // Input ports: Control and clock signals
  input wire j;               // J input (set control)
  input wire k;               // K input (reset control)
  input wire clk;             // Clock signal for synchronization
  input wire reset;           // Reset signal (active low)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Sequential logic: JK flip-flop operation on clock edge
  always@(posedge clk or negedge reset)  // Triggered by clock or reset
    begin
      if(!reset)              // Active low reset
        begin
          q <= 1'b0;          // Reset Q to 0
          qb <= 1'b1;          // Reset Q-bar to 1
        end
      else                    // Normal operation
        begin
          case({j,k})          // Check J and K inputs
            2'b00: begin       // J=0, K=0: Hold current state
              q <= q;          // Q remains unchanged
              qb <= qb;        // Q-bar remains unchanged
            end
            2'b01: begin       // J=0, K=1: Reset to 0
              q <= 1'b0;       // Set Q to 0
              qb <= 1'b1;      // Set Q-bar to 1
            end
            2'b10: begin       // J=1, K=0: Set to 1
              q <= 1'b1;       // Set Q to 1
              qb <= 1'b0;      // Set Q-bar to 0
            end
            2'b11: begin       // J=1, K=1: Toggle
              q <= ~q;         // Toggle Q
              qb <= ~qb;       // Toggle Q-bar
            end
          endcase
        end
    end
endmodule
