///1 TO 16 DEMUX:-

module demux1to16(d,sel,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15);
  input wire d;
  input wire [3:0]sel;
  output reg a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
  always@(*)
    begin
      case({sel})
        4'b0000:a0=d;
        4'b0001:a1=d;
        4'b0010:a2=d;
        4'b0011:a3=d;
        4'b0100:a4=d;
        4'b0101:a5=d;
        4'b0110:a6=d;
        4'b0111:a7=d;
        4'b1000:a8=d;
        4'b1001:a9=d;
        4'b1010:a10=d;
        4'b1011:a11=d;
        4'b1100:a12=d;
        4'b1101:a13=d;
        4'b1110:a14=d;
        4'b1111:a15=d;
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
