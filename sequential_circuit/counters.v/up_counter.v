

///UP COUNTER:-
module upcounter(clk,reset,up,cout);
  input wire clk,reset,up;
  output reg [3:0]cout;
  always@(posedge clk)
    begin
      if(!reset)
        cout<=4'b0000;
      else if(up)
        cout<=cout+1'b1;
      else
        cout<=4'b0000;
    end
endmodule




///TESTBENCH:-
module tb;
  reg clk,reset,up;
  wire [3:0]cout;
  always #2 clk=~clk;
  upcounter dut(.clk(clk),.reset(reset),.up(up),.cout(cout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,up=%0b,cout=%0b",clk,reset,up,cout);
      #0  reset=1'b0;
      up=1'b0;
      clk=1'b0;
      #5  reset=1'b1;
      up=1'b1;
      clk=1'b1;
      #30 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
