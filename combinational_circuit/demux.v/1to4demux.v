///1 TO 4 DEMUX:-

module demux1to4(d,sel,y0,y1,y2,y3);
  input wire d;
  input wire [1:0]sel;
  output reg y0,y1,y2,y3;
  always@(*)
    begin
      case(sel)
        2'b00:y0=d;
        2'b01:y1=d;
        2'b10:y2=d;
        2'b11:y3=d;
   
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
