///4TO1MUX:-

module mux4to1(a0,a1,a2,a3,sel,y);
  input wire a0,a1,a2,a3;
  input wire [1:0]sel;
  output reg y;
  always@(*)
    begin
      case({sel})
        2'b00:y=a0;
        2'b01:y=a1;
        2'b10:y=a2;
        2'b11:y=a3;
        
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
