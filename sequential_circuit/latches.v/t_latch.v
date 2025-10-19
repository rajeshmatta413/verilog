

///T LATCH:-
module tlatch(t,en,q,qb);
  input wire t,en;
  output reg q,qb;
  
  always@(en or t)
    begin
      if(en)
      q<=~t;
  end
  assign qb=~q;
endmodule
  



///TESTBENCH:-

module tb;
  reg t,en;
  wire q,qb;
  
  tlatch dut(.t(t),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"t=%0b,en=%0b,q=%0b,qb=%0b",t,en,q,qb);
      #0 en=1'b0;
      #0 t=1'b0;
      
      #5 en=1'b1;
      #5 t=1'b0;
      #5 t=1'b1;
      #5 t=1'b0;
      #5 t=1'b1;
      
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule

