///1 TO 16 DEMULTIPLEXER - Complete Implementation
/// Demultiplexer routes one input to one of sixteen outputs based on 4-bit select signal
/// This provides extensive routing capabilities for complex systems
/// Real-world applications: Memory bank selection, peripheral addressing, data distribution networks

module demux1to16(d,sel,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15);
  // Input ports: Data input and select signal
  input wire d;               // Data input to be routed
  input wire [3:0]sel;        // Select signal (4-bit control for 16 outputs)
  
  // Output ports: Sixteen possible output destinations
  output reg a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
  
  // Combinational logic: Route input to selected output based on 4-bit select signal
  always@(*)                  // Executes whenever inputs change
    begin
      case({sel})             // Check select signal value
        4'b0000: a0 = d;      // When sel=0000, route data to a0
        4'b0001: a1 = d;      // When sel=0001, route data to a1
        4'b0010: a2 = d;      // When sel=0010, route data to a2
        4'b0011: a3 = d;      // When sel=0011, route data to a3
        4'b0100: a4 = d;      // When sel=0100, route data to a4
        4'b0101: a5 = d;      // When sel=0101, route data to a5
        4'b0110: a6 = d;      // When sel=0110, route data to a6
        4'b0111: a7 = d;      // When sel=0111, route data to a7
        4'b1000: a8 = d;      // When sel=1000, route data to a8
        4'b1001: a9 = d;      // When sel=1001, route data to a9
        4'b1010: a10 = d;     // When sel=1010, route data to a10
        4'b1011: a11 = d;     // When sel=1011, route data to a11
        4'b1100: a12 = d;     // When sel=1100, route data to a12
        4'b1101: a13 = d;     // When sel=1101, route data to a13
        4'b1110: a14 = d;     // When sel=1110, route data to a14
        4'b1111: a15 = d;     // When sel=1111, route data to a15
        // Default case not needed for 4-bit select
      endcase
    end
endmodule     








///TEST BENCH:-


module tb;
  reg d;
  reg [3:0]sel;
  wire a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
  demux1to16 dut(.d(d),.sel(sel),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.a8(a8),.a9(a9),.a10(a10),.a11(a11),.a12(a12),.a13(a13),.a14(a14),.a15(a15));
  initial
    begin
$monitor($time,"d=%0b,sel=%0b,a0=%0b,a1=%0b,a2=%0b,a3=%0b,a4=%0b,a5=%0b,a6=%0b,a7=%0b,a8=%0b,a9=%0b,a10=%0b,a11=%0b,a12=%0b,a13=%0b,a14=%0b,a15=%0b",d,sel,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15);
      #10   d=1;
      #10 sel=4'b0000;
      #10 sel=4'b0001;
      #10 sel=4'b0010;
      #10 sel=4'b0011;
      #10 sel=4'b0100;
      #10 sel=4'b0101;
      #10 sel=4'b0110;
      #10 sel=4'b0111;
      #10 sel=4'b1000;
      #10 sel=4'b1001;
      #10 sel=4'b1010;
      #10 sel=4'b1011;
      #10 sel=4'b1100;
      #10 sel=4'b1101;
      #10 sel=4'b1110;
      #10 sel=4'b1111;
     end
  initial
    begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
  end
endmodule
