///1 TO 4 DEMULTIPLEXER - Complete Implementation
/// Demultiplexer routes one input to one of four outputs based on 2-bit select signal
/// This expands the basic demux concept to handle more outputs
/// Real-world applications: Memory bank selection, peripheral routing, data distribution

module demux1to4(d,sel,y0,y1,y2,y3);
  // Input ports: Data input and select signal
  input wire d;               // Data input to be routed
  input wire [1:0]sel;        // Select signal (2-bit control for 4 outputs)
  
  // Output ports: Four possible output destinations
  output reg y0;              // Output 0 (selected when sel=00)
  output reg y1;              // Output 1 (selected when sel=01)
  output reg y2;              // Output 2 (selected when sel=10)
  output reg y3;              // Output 3 (selected when sel=11)
  
  // Combinational logic: Route input to selected output based on 2-bit select signal
  always@(*)                  // Executes whenever inputs change
    begin
      case(sel)               // Check select signal value
        2'b00: y0 = d;        // When sel=00, route data to y0
        2'b01: y1 = d;        // When sel=01, route data to y1
        2'b10: y2 = d;        // When sel=10, route data to y2
        2'b11: y3 = d;        // When sel=11, route data to y3
        // Default case not needed for 2-bit select
      endcase
    end
endmodule
        

///TEST BENCH:-
module tb;
  reg d;
  reg [1:0]sel;
  wire y0,y1,y2,y3;
  demux1to4 dut(.d(d),.sel(sel),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
  initial 
begin
$monitor($time,"d=%0b,sel=%0b,y0=%0b,y1=%0b,y2=%0b,y3=%0b",d,sel,y0,y1,y2,y3);
      #10 d=1'b1; sel=2'b00;        #10 sel=2'b01;
     #10 sel=2'b10;             #10 sel=2'b11;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
