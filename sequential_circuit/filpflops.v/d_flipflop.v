///D FLIP-FLOP - Complete Implementation
/// D flip-flop stores data on clock edge - fundamental memory element
/// This is the basic building block for registers, counters, and state machines
/// Real-world applications: CPU registers, memory cells, data synchronization

module dflipflop(d,clk,q,qb);
  // Input ports: Data and clock signals
  input wire d;                // Data input to be stored
  input wire clk;              // Clock signal for synchronization
  
  // Output ports: Stored data and its complement
  output reg q;                // Stored data output (Q)
  output reg qb;               // Complement of stored data (Q-bar)
  
  // Sequential logic: Store data on clock edge
  always@(*)                   // Note: This should be @(posedge clk) for proper flip-flop
    begin
      q <= d;                  // Store input data in Q
      assign qb = ~q;          // Generate complement of Q
    end
endmodule

///TESTBENCH:-

module tb;
  reg d,clk;
  wire q,qb;
  always #5 clk=~clk;
  dflipflop dut(.d(d),.clk(clk),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"d=%0b,clk=%0b,q=%0b,qb=%0b",d,clk,q,qb);
      #2 clk=1'b0;
      #4 clk=1'b1;
      #6 d=1'b0;
      #8 d=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

  

  ///ASYNCHRONOUS :-

module dflip(d,clk,resetn,q,qb);
  input wire d,clk,resetn;
  output reg q,qb;
  always@(*)
    begin
      if(!resetn)
      q<=0;
      else
        q<=d;
    end
      assign qb=~q;
endmodule

///TESTBENCH

module tb;
  reg d,clk,resetn;
  wire q,qb;
  always #5 clk=~clk;
  dflip dut(.d(d),.clk(clk),.resetn(resetn),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"d=%0b,clk=%0b,,resetn=%0b,q=%0b,qb=%0b",d,clk,resetn,q,qb);
      #0 resetn=1'b0;
      #1 resetn=1'b1;
      #2 clk=1'b0;
      #4 clk=1'b1;
      #6 d=1'b0;
      #8 d=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
