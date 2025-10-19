

///UP COUNTER - Complete Implementation
/// Counter increments its value on each clock edge when enabled
/// This is fundamental for timing, addressing, and control applications
/// Real-world applications: Timer circuits, address generators, frequency dividers

module upcounter(clk,reset,up,cout);
  // Input ports: Control signals
  input wire clk;              // Clock signal for synchronous operation
  input wire reset;             // Reset signal (active low)
  input wire up;                // Count enable signal
  
  // Output port: Counter value
  output reg [3:0]cout;        // 4-bit counter output (0 to 15)
  
  // Sequential logic: Counter operation on clock edge
  always@(posedge clk)          // Executes on rising clock edge
    begin
      if(!reset)               // Active low reset
        cout <= 4'b0000;       // Reset counter to 0
      else if(up)              // If count enable is active
        cout <= cout + 1'b1;   // Increment counter by 1
      else                     // If count enable is inactive
        cout <= 4'b0000;       // Hold counter at 0
    end
endmodule




///TESTBENCH:-
module tb;
  reg clk,reset,up;
  wire [3:0]cout;
  always #2 clk=~clk;
  upcounter dut(.clk(clk),.reset(reset),.up(up),.cout(cout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,up=%0b,cout=%0b",clk,reset,up,cout);
      #0  reset=1'b0;
      up=1'b0;
      clk=1'b0;
      #5  reset=1'b1;
      up=1'b1;
      clk=1'b1;
      #30 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
