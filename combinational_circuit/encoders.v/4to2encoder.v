///4 TO 2 ENCODER:-

module encoder4to2(a,y);
  input wire [3:0]a;
  output reg [1:0]y;
  always@(*)
    begin
      case(a)
        4'b0001: y=2'b00;
        4'b0010: y=2'b01;
        4'b0100: y=2'b10;
        4'b1000: y=2'b11;
      endcase
    end
endmodule





///TESTBENCH:-

module tb;
  reg [3:0]a;
  wire [1:0]y;
  
  encoder4to2 dut(.a(a),.y(y));
  initial 
    begin
      $monitor($time,"a=%0b,y=%b",a,y);
     #10  a=4'b0001;
     #10  a=4'b0010;
     #10  a=4'b0100;
     #10  a=4'b1000;
    
     
    end
endmodule
