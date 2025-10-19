///2-TO-1 MULTIPLEXER - Complete Implementation
/// Multiplexer selects one of multiple inputs based on select signal
/// This is a fundamental building block for data path selection in processors
/// Real-world applications: CPU data path selection, register file access, signal routing

module mux2to1(a0,a1,sel,y);
  // Input ports: Two data inputs and one select signal
  input wire a0;              // First data input (selected when sel=0)
  input wire a1;              // Second data input (selected when sel=1)
  input wire sel;             // Select signal (1-bit control)
  
  // Output port: Selected data
  output reg y;               // Output: Selected data from a0 or a1
  
  // Combinational logic: Selects input based on select signal
  always@(*)                  // Executes whenever any input changes
    begin
      case(sel)               // Check select signal value
        1'b0: y = a0;         // When sel=0, output = a0
        1'b1: y = a1;         // When sel=1, output = a1
        // Default case not needed for 1-bit select
      endcase
    end
endmodule     


///TEST BENCH:-
module tb;
  reg a0,a1;
  reg sel;
  wire y;
  mux2to1 dut(.a0(a0),.a1(a1),.sel(sel),.y(y));
  initial
    begin
      $monitor($time,"a0=%0b,a1=%0b,sel=%0b,y=%0b",a0,a1,sel,y);
      #10   sel=1'b0;
      a0=1'b1;
      a1=1'b0;
      
      #10   sel=1'b1;
      a0=1'b0;
      a1=1'b1;
    end
  initial
    begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  end
endmodule
