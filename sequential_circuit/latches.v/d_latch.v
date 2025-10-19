

///D LATCH:-

module dlatch(d,en,q,qb);
  input wire d,en;
  output reg q,qb;
  
  always@(en or d)
    begin
      if(en)
      q<=d;
  end
  assign qb=~q;
endmodule



///TESTBENCH:

module tb;
  reg d,en;
  wire q,qb;
  
  dlatch dut(.d(d),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"d=%0b,en=%0b,q=%0b,qb=%0b",d,en,q,qb);
      #0 en=1'b0;
      #0 d=1'b0;
      
      #5 en=1'b1;
      #5 d=1'b0;
      #5 d=1'b1;
      
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

