///D FlipFlop:-

module dflipflop(d,clk,q,qb);
  input wire d,clk;
  output reg q,qb;
  always@(*)
    begin
      q<=d;
      assign qb=~q;
    end
endmodule

///TESTBENCH:-

module tb;
  reg d,clk;
  wire q,qb;
  always #5 clk=~clk;
  dflipflop dut(.d(d),.clk(clk),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"d=%0b,clk=%0b,q=%0b,qb=%0b",d,clk,q,qb);
      #2 clk=1'b0;
      #4 clk=1'b1;
      #6 d=1'b0;
      #8 d=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

  

  ///ASYNCHRONOUS :-

module dflip(d,clk,resetn,q,qb);
  input wire d,clk,resetn;
  output reg q,qb;
  always@(*)
    begin
      if(!resetn)
      q<=0;
      else
        q<=d;
    end
      assign qb=~q;
endmodule

///TESTBENCH

module tb;
  reg d,clk,resetn;
  wire q,qb;
  always #5 clk=~clk;
  dflip dut(.d(d),.clk(clk),.resetn(resetn),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"d=%0b,clk=%0b,,resetn=%0b,q=%0b,qb=%0b",d,clk,resetn,q,qb);
      #0 resetn=1'b0;
      #1 resetn=1'b1;
      #2 clk=1'b0;
      #4 clk=1'b1;
      #6 d=1'b0;
      #8 d=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
