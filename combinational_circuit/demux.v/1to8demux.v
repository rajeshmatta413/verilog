///1 TO 8 DEMULTIPLEXER - Complete Implementation
/// Demultiplexer routes one input to one of eight outputs based on 3-bit select signal
/// This provides more routing options for complex data distribution
/// Real-world applications: Memory module selection, peripheral addressing, signal distribution

module demux1to8(d,sel,y0,y1,y2,y3,y4,y5,y6,y7);
  // Input ports: Data input and select signal
  input wire d;               // Data input to be routed
  input wire [2:0]sel;        // Select signal (3-bit control for 8 outputs)
  
  // Output ports: Eight possible output destinations
  output reg y0;              // Output 0 (selected when sel=000)
  output reg y1;              // Output 1 (selected when sel=001)
  output reg y2;              // Output 2 (selected when sel=010)
  output reg y3;              // Output 3 (selected when sel=011)
  output reg y4;              // Output 4 (selected when sel=100)
  output reg y5;              // Output 5 (selected when sel=101)
  output reg y6;              // Output 6 (selected when sel=110)
  output reg y7;              // Output 7 (selected when sel=111)
  
  // Combinational logic: Route input to selected output based on 3-bit select signal
  always@(*) begin             // Executes whenever inputs change
      case(sel)               // Check select signal value
        3'b000: y0 = d;        // When sel=000, route data to y0
        3'b001: y1 = d;        // When sel=001, route data to y1
        3'b010: y2 = d;        // When sel=010, route data to y2
        3'b011: y3 = d;        // When sel=011, route data to y3
        3'b100: y4 = d;        // When sel=100, route data to y4
        3'b101: y5 = d;        // When sel=101, route data to y5
        3'b110: y6 = d;        // When sel=110, route data to y6
        3'b111: y7 = d;        // When sel=111, route data to y7
        // Default case not needed for 3-bit select
      endcase
    end
endmodule        


///TEST BENCH:-
module tb;
  reg d;
  reg [2:0]sel;
  wire y0,y1,y2,y3,y4,y5,y6,y7;
  demux1to8 dut(.d(d),.sel(sel),.y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7));
  initial
    begin
      $monitor($time,"d=%0b,sel=%0b,y0=%0b,y1=%0b,y2=%0b,y3=%0b,y4=%0b,y5=%0b,y6=%0b,y7=%0b",d,sel,y0,y1,y2,y3,y4,y5,y6,y7);
      #10 sel=3'b000;
      #10 sel=3'b001;
      #10 sel=3'b010;
      #10 sel=3'b011;
      #10 sel=3'b100;
      #10 sel=3'b101;
      #10 sel=3'b110;
      #10 sel=3'b111;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
