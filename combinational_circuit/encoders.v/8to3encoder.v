///8 TO 3 ENCODER:-

module encoder(data,out);
  input wire[7:0] data;
  output reg [2:0] out;
  always@(*)
    begin
      casex({data})
      8'b00000001:out=3'b000;
      8'b0000001x:out=3'b001;
      8'b000001xx:out=3'b010;
      8'b00001xxx:out=3'b011;
      8'b0001xxxx:out=3'b100;
      8'b001xxxxx:out=3'b101;
      8'b01xxxxxx:out=3'b110;
      8'b1xxxxxxx:out=3'b111;
        default:out=3'bxxx;
      endcase
  end
endmodule

///TEST BENCH:-
module tb;
   reg [7:0] data;
   wire [2:0] out;
  encoder dut(.data(data),.out(out));
  initial  begin
      $monitor($time,"data=%0b,out=%0b",data,out);
       #10 data=8'b00000001;
       #10 data=8'b0000001x;
       #10 data=8'b000001xx;
       #10 data=8'b00001xxx;
       #10 data=8'b0001xxxx;
       #10 data=8'b001xxxxx;
       #10 data=8'b01xxxxxx;
       #10 data=8'b1xxxxxxx;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
