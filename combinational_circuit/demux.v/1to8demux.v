 ///1 TO 8 DEMUX:-

module demux1to8(d,sel,y0,y1,y2,y3,y4,y5,y6,y7);
  input wire d;
  input wire [2:0]sel;
  output reg y0,y1,y2,y3,y4,y5,y6,y7;
  always@(*) begin
      case(sel)
        3'b000:y0=d;
        3'b001:y1=d;
        3'b010:y2=d;
        3'b011:y3=d;
        3'b100:y4=d;
        3'b101:y5=d;
        3'b110:y6=d;
        3'b111:y7=d;
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
