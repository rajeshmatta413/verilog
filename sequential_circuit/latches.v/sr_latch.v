///SR LATCH:-

module srlatch(s,r,en,q,qb);
  input wire s,r,en;
  output reg q,qb;
  
  always@(en or s or r)
      if (en)
        begin
          case({s,r})
              2'b00:q<=q;
              2'b01:q<=0;
              2'b10:q<=1;
              2'b11:q<=1'bx;
          endcase
        end
  assign qb=~q;
endmodule


///TESTBENCH:-

module tb;
  reg s,r,en;
  wire q,qb;
  
  srlatch dut(.s(s),.r(r),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"s=%0b,r=%0b,en=%0b,q=%0b,qb=%0b",s,r,en,q,qb);
      #0 en=1'b0;
      #0 s=1'b0; r=1'b0;
      
     
      #5 en=1'b1;
      #5 s=1'b0; r=1'b0;
      #5 s=1'b0; r=1'b1;
      #5 s=1'b1; r=1'b0;
      #5 s=1'b1; r=1'b1;
    end
endmodule
