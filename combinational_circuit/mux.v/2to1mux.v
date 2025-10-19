///2TO1MUX:-

module mux2to1(a0,a1,sel,y);
  input wire a0,a1;
  input wire sel;
  output reg y;
  always@(*)
    begin
      case({sel})
        1'b0:y=a0;
        1'b1:y=a1;
        
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
