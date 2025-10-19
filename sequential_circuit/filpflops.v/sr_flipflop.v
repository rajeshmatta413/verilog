///SR FLIPFLOP:-

module sr_flipflop(s,r,clk,reset,q,qb);
  input wire s,r,clk,reset;
  output reg q,qb;
  always@(*)
    begin
      if(reset)
        begin
      q<=0;
    end
      else
        begin
          case({s,r})
            2'b00:q=q;
            2'b01:q=0;
            2'b10:q=1;
            2'b11:q=1'bx;
    endcase
  end
      assign qb=~q;
    end
endmodule

///TESTBENCH:-

module tb;
  reg s,r,clk,reset;
  wire q,qb;
  always #2 clk=~clk;
  sr_flipflop dut(.s(s),.r(r),.clk(clk),.reset(reset),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"s=%0b,r=%0b,clk=%0b,reset=%0b,q=%0b,qb=%0b",s,r,clk,reset,q,qb);
      #0 reset=1'b0;
      #1 reset=1'b1;
      #2 clk=1'b0;
      #3 clk=1'b1;
      #4 s=1'b0; r=1'b0;
      #5 s=1'b0; r=1'b1;
      #6 s=1'b1; r=1'b0;
      #7 s=1'b1; r=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
      







///ASYNCHRONOUS:-

module sr_flipflop(s,r,clk,resetn,q,qb);
  input wire s,r,clk,resetn;
  output reg q,qb;
  always@(*)
    begin
      if(!resetn)
        q=1'b0;
          else
            begin
              case({s,r})
            2'b00:q=q;
            2'b01:q=0;
            2'b10:q=1;
            2'b11:q=1'bx;
    endcase
  end
      assign qb=~q;
    end
endmodule



///TESTBENCH:-
module tb;
  reg s,r,clk,resetn;
  wire q,qb;
  always #2 clk=~clk;
  sr_flipflop dut(.s(s),.r(r),.clk(clk),.resetn(resetn),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"s=%0b,r=%0b,clk=%0b,resetn=%0b,q=%0b,qb=%0b",s,r,clk,resetn,q,qb);
      #0 resetn=1'b0;
      #1 resetn=1'b1;
      #2 clk=1'b0;
      #3 clk=1'b1;
      #4 s=1'b0; r=1'b0;
      #5 s=1'b0; r=1'b1;
      #6 s=1'b1; r=1'b0;
      #7 s=1'b1; r=1'b1;
      #10 $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
      
