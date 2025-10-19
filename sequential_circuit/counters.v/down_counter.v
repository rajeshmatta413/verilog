

///DOWN COUNTER - Complete Implementation
/// Counter decrements its value on each clock edge when enabled
/// This is fundamental for countdown timers and reverse counting applications
/// Real-world applications: Timer circuits, countdown displays, frequency dividers

module downcounter(clk,reset,down,cout);
  // Input ports: Control signals
  input wire clk;             // Clock signal for synchronous operation
  input wire reset;           // Reset signal (active low)
  input wire down;            // Count enable signal (active high)
  
  // Output port: Counter value
  output reg [3:0]cout;       // 4-bit counter output (15 down to 0)
  
  // Sequential logic: Counter operation on clock edge
  always@(posedge clk)        // Executes on rising clock edge
    begin
      if(!reset)              // Active low reset
        cout <= 4'b0000;      // Reset counter to 0
      else if(down)           // If count enable is active
        cout <= cout-1'b1;    // Decrement counter by 1
      else                    // If count enable is inactive
        cout <= 4'b1111;      // Set counter to maximum value (15)
    end
endmodule



///TESTBENCH:-
module tb;
  reg clk,reset,down;
  wire [3:0]cout;
  always #1 clk=~clk;
  downcounter dut(.clk(clk),.reset(reset),.down(down),.cout(cout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,down=%0b,cout=%0b",clk,reset,down,cout);
      #5  reset=1'b0;
      down=1'b0;
      clk=1'b0;
      #15  reset=1'b1;
      down=1'b1;
      clk=1'b1;
      #20 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
