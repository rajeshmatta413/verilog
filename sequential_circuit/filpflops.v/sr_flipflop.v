///SR FLIP-FLOP - Complete Implementation
/// SR flip-flop has two inputs (S, R) for set and reset operations
/// S=1, R=0: Set output to 1; S=0, R=1: Set output to 0; S=R=0: Hold; S=R=1: Invalid
/// Real-world applications: Basic memory elements, control circuits, state storage

module sr_flipflop(s,r,clk,reset,q,qb);
  // Input ports: Control and clock signals
  input wire s;               // S input (set control)
  input wire r;               // R input (reset control)
  input wire clk;             // Clock signal for synchronization
  input wire reset;           // Reset signal (active high)
  
  // Output ports: Stored data and its complement
  output reg q;               // Stored data output (Q)
  output reg qb;              // Complement of stored data (Q-bar)
  
  // Sequential logic: SR flip-flop operation on clock edge
  always@(posedge clk)        // Executes on rising clock edge
    begin
      if(reset)               // Active high reset
        begin
          q <= 1'b0;          // Reset Q to 0
        end
      else                    // Normal operation
        begin
          case({s,r})         // Check S and R inputs
            2'b00: q <= q;    // S=0, R=0: Hold current state
            2'b01: q <= 1'b0; // S=0, R=1: Reset to 0
            2'b10: q <= 1'b1; // S=1, R=0: Set to 1
            2'b11: q <= 1'bx; // S=1, R=1: Invalid state (undefined)
          endcase
        end
    end
  assign qb = ~q;             // Q-bar is always complement of Q
endmodule

///TESTBENCH:-

module tb;
  reg s,r,clk,reset;
  wire q,qb;
  always #2 clk=~clk;
  sr_flipflop dut(.s(s),.r(r),.clk(clk),.reset(reset),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"s=%0b,r=%0b,clk=%0b,reset=%0b,q=%0b,qb=%0b",s,r,clk,reset,q,qb);
      #0 reset=1'b0;
      #1 reset=1'b1;
      #2 clk=1'b0;
      #3 clk=1'b1;
      #4 s=1'b0; r=1'b0;
      #5 s=1'b0; r=1'b1;
      #6 s=1'b1; r=1'b0;
      #7 s=1'b1; r=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
      







///ASYNCHRONOUS:-

module sr_flipflop(s,r,clk,resetn,q,qb);
  input wire s,r,clk,resetn;
  output reg q,qb;
  always@(*)
    begin
      if(!resetn)
        q=1'b0;
          else
            begin
              case({s,r})
            2'b00:q=q;
            2'b01:q=0;
            2'b10:q=1;
            2'b11:q=1'bx;
    endcase
  end
      assign qb=~q;
    end
endmodule



///TESTBENCH:-
module tb;
  reg s,r,clk,resetn;
  wire q,qb;
  always #2 clk=~clk;
  sr_flipflop dut(.s(s),.r(r),.clk(clk),.resetn(resetn),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"s=%0b,r=%0b,clk=%0b,resetn=%0b,q=%0b,qb=%0b",s,r,clk,resetn,q,qb);
      #0 resetn=1'b0;
      #1 resetn=1'b1;
      #2 clk=1'b0;
      #3 clk=1'b1;
      #4 s=1'b0; r=1'b0;
      #5 s=1'b0; r=1'b1;
      #6 s=1'b1; r=1'b0;
      #7 s=1'b1; r=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
      
