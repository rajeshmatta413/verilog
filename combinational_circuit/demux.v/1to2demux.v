///1 TO 2 DEMULTIPLEXER - Complete Implementation
/// Demultiplexer routes one input to one of two outputs based on select signal
/// This is the inverse operation of a multiplexer
/// Real-world applications: Data distribution, signal routing, address decoding

module demux1to2(d,sel,y0,y1);
  // Input ports: Data input and select signal
  input wire d;               // Data input to be routed
  input wire sel;             // Select signal (1-bit control)
  
  // Output ports: Two possible output destinations
  output reg y0;              // Output 0 (selected when sel=0)
  output reg y1;              // Output 1 (selected when sel=1)
  
  // Combinational logic: Route input to selected output based on select signal
  always@(*)                  // Executes whenever inputs change
    begin
      case(sel)               // Check select signal value
        1'b0: y0 = d;         // When sel=0, route data to y0
        1'b1: y1 = d;         // When sel=1, route data to y1
        // Default case not needed for 1-bit select
      endcase
    end
endmodule






///TEST BENCH:-
module tb;
  reg d,sel;
  wire y0,y1;
  demux1to2 dut(.d(d),.sel(sel),.y0(y0),.y1(y1));
  initial
    begin
$monitor($time,"d=%0b,sel=%0b,y0=%0b,y1=%0b",d,sel,y0,y1);
      #10 d=1'b1; sel=1'b0;
      #10  sel=1'b1;
      #10 d=1'b0; sel=1'b0;
      #10 sel=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
