///2 TO 4 DECODER:-

module decoder2to4(a,y);
  input wire [1:0]a;
  output reg [3:0]y;
  always@(*)
    begin
      case(a)
        2'b00: y=4'b0001;
        2'b01: y=4'b0010;
        2'b10: y=4'b0100;
        2'b11: y=4'b1000;
      endcase
    end
endmodule




///TESTBENCH:-

module tb;
  reg [1:0]a;
  wire [3:0]y;
  
  decoder2to4 dut(.a(a),.y(y));
  initial 
    begin
      $monitor($time,"a=%0b,y=%b",a,y);
     #10  a=2'b00;
     #10  a=2'b01;
     #10  a=2'b10;
     #10  a=2'b11;
    
      
     
    end
endmodule
