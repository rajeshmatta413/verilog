///4 TO 1 MULTIPLEXER - Complete Implementation
/// Multiplexer selects one of four inputs based on 2-bit select signal
/// This expands the basic mux concept to handle more inputs
/// Real-world applications: Data path selection, register file access, signal routing

module mux4to1(a0,a1,a2,a3,sel,y);
  // Input ports: Four data inputs and select signal
  input wire a0;              // Data input 0 (selected when sel=00)
  input wire a1;              // Data input 1 (selected when sel=01)
  input wire a2;              // Data input 2 (selected when sel=10)
  input wire a3;              // Data input 3 (selected when sel=11)
  input wire [1:0]sel;        // Select signal (2-bit control for 4 inputs)
  
  // Output port: Selected data
  output reg y;               // Output: Selected data from one of the four inputs
  
  // Combinational logic: Select input based on 2-bit select signal
  always@(*)                  // Executes whenever inputs change
    begin
      case({sel})             // Check select signal value
        2'b00: y = a0;        // When sel=00, output = a0
        2'b01: y = a1;        // When sel=01, output = a1
        2'b10: y = a2;        // When sel=10, output = a2
        2'b11: y = a3;        // When sel=11, output = a3
        // Default case not needed for 2-bit select
      endcase
    end
endmodule     


///TESTBENCH:-
module tb;
  reg a0,a1,a2,a3;
  reg [1:0]sel;
  wire y;
  mux4to1 dut(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.sel(sel),.y(y));
  initial
    begin
$monitor($time,"a0=%0b,a1=%0b,a2=%0b,a3=%0b,sel=%0b,y=%0b",a0,a1,a2,a3,sel,y);
      #10   sel=2'b00;
      a0=1'b1;
      a1=1'b0;
      a2=1'b0;
      a3=1'b0;
      #10   sel=2'b01;
      a0=1'b0;
      a1=1'b1;
      a2=1'b0;
a3=1'b0;
      #10   sel=2'b10;
      a0=1'b0;
      a1=1'b0;
      a2=1'b1;
      a3=1'b0;
      #10   sel=2'b11;
      a0=1'b0;
      a1=1'b0;
      a2=1'b0;
      a3=1'b1;
       #10   sel=2'b11;
      a0=1'b0;   a1=1'b0;   a2=1'b1;   a3=1'b1;
    end
  initial
    begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  end
endmodule
