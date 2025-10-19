

///DOWN COUNTER:-
module downcounter(clk,reset,down,cout);
  input wire clk,reset,down;
  output reg [3:0]cout;
  always@(posedge clk)
    begin
      if(!reset)
        cout<=4'b0000;
      else if(down)
        cout<=cout-1'b1;
      else
        cout<=4'b1111;
    end
endmodule



///TESTBENCH:-
module tb;
  reg clk,reset,down;
  wire [3:0]cout;
  always #1 clk=~clk;
  downcounter dut(.clk(clk),.reset(reset),.down(down),.cout(cout));
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,down=%0b,cout=%0b",clk,reset,down,cout);
      #5  reset=1'b0;
      down=1'b0;
      clk=1'b0;
      #15  reset=1'b1;
      down=1'b1;
      clk=1'b1;
      #20 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
