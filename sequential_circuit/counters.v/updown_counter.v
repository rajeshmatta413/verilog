

///UP/DOWN COUNTER - Complete Implementation
/// Counter can increment or decrement based on control signal
/// This provides bidirectional counting capability for versatile applications
/// Real-world applications: Position encoders, bidirectional timers, reversible counters

module updown(clk,reset,up,cout);
  // Input ports: Control signals
  input wire clk;             // Clock signal for synchronous operation
  input wire reset;           // Reset signal (active low)
  input wire up;              // Direction control (1=up, 0=down)
  
  // Output port: Counter value
  output reg [3:0]cout;       // 4-bit counter output (0 to 15)
  
  // Sequential logic: Bidirectional counter operation on clock edge
  always@(posedge clk)        // Executes on rising clock edge
    begin
      if(!reset)              // Active low reset
        cout <= 4'b0000;      // Reset counter to 0
      else if(up)             // If up control is active
        cout <= cout+1'b1;    // Increment counter by 1
      else                    // If up control is inactive (down mode)
        cout <= cout-1'b1;    // Decrement counter by 1
    end
endmodule


///TESTBENCH:-
module tb;
  reg clk,reset,up;
  wire [3:0]cout;
  always #1 clk=~clk;
  updown dut(.clk(clk),.reset(reset),.up(up),.cout(cout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,up=%0b,cout=%0d",clk,reset,up,cout);
      #0
      reset=1'b0;
      up=1'b0;
      clk=1'b0;
      #5
      reset=1'b1;
      up=1'b1;
      clk=1'b1;
      #20 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
