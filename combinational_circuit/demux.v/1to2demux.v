///1 TO 2 DEMUX:-

module demux1to2(d,sel,y0,y1);
  input wire d,sel;
  output reg y0,y1;
  always@(*)
    begin
      case(sel)
        1'b0:y0=d;
        1'b1:y1=d;
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
