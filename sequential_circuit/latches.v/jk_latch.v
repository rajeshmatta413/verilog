///JK LATCH:-

module jklatch(j,k,en,q,qb);
  input wire j,k,en;
  output reg q,qb;
  
  always@(en or j or k)
    if(en)
      begin
        case({j,k})
          2'b00: q<=q;
          2'b01: q<=0;
          2'b10: q<=1;
          2'b11: q<=~q;
        endcase
      end
  assign qb=~q;
endmodule



///TESTBENCH

module tb;
  reg j,k,en;
  wire q,qb;
  
  jklatch dut(.j(j),.k(k),.en(en),.q(q),.qb(qb));
  initial
    begin
      $monitor($time,"j=%0b,k=%0b,en=%0b,q=%0b,qb=%0b",j,k,en,q,qb);
      #0 en=1'b0;
      #0 j=1'b0; k=1'b0;
      
      #5 en=1'b1;
      #5 j=1'b0; k=1'b0;
      #5 j=1'b0; k=1'b1;
      #5 j=1'b1; k=1'b0;
      #5 j=1'b1; k=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
