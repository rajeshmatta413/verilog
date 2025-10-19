
///OPERATORS:-

module operators(a,b,m,y,s,mo,d,g,l,ge,le,eq,neq,ca_eq,ca_neq,logic_and,logic_not,bit_and,sh_r);
  input wire [3:0]a;
  input wire [3:0]b;
  output reg [4:0]m;
  output reg [4:0]y;
  output reg [4:0]s;
  output reg [4:0]mo;
  output reg [4:0]d;
  output reg g;
  output reg l;
  output reg ge;
  output reg le;
  output reg eq;
  output reg neq;
  output reg ca_eq;
  output reg ca_neq;
  output reg logic_and;
  output reg logic_not;
  output reg bit_and;
  output reg sh_r;
  //1 arithmetic operators
  assign m = a * b;
  assign y = a + b;
  assign s = a - b;
  //assign mo = a %% b;
  assign d = a / b;
  //2 relational operators
  assign g = a > b;
  assign l = a < b;
  assign ge = a >= b;
  assign le = a <= b;
  //3 equality operators
  assign eq = a == b;
  assign neq = a != b;
  assign ca_eq = a === b;
  assign ca_neq = a !== b;
  //logical operators
  assign logic_and = (b<a)&&(a>b); //it is used to and operation after the getting relational o/p
  assign logic_not = !(b>a);
  //bitwise operators
  assign bit_and = a & b;
  //shift operators
  assign sh_r = a >> 1;
endmodule
  










///TESTBENCH:-
module tb;
  reg [3:0]a;
  reg [3:0]b;
  wire [4:0]m;
  wire [4:0]y;
  wire [4:0]s;
  wire [4:0]mo;
  wire [4:0]d;
  wire g;
  wire l;
  wire ge;
  wire le;
  wire eq;
  wire neq;
  wire ca_eq;
  wire ca_neq;
  wire logic_and;
  wire logic_not;
  wire bit_and;
  wire sh_r;
  
  operators dut(.a(a),.b(b),.m(m),.y(y),.s(s),.mo(mo),.d(d),.g(g),.l(l),.ge(ge),.le(le),.eq(eq),.neq(neq),.ca_eq(ca_eq),.ca_neq(ca_neq),.logic_and(logic_and),.logic_not(logic_not),.bit_and(bit_and),.sh_r(sh_r));
  initial
    begin
      //1 arithmetic operators
      #10 a=4'b1000; b=4'b0001;
      $display("Multiplication : %b * %b = %b",a,b,m);
      #10 a=4'b1000; b=4'b1100;
      $display("Addition : %b + %b = %b",a,b,y);
      #10 a=4'b1000; b=4'b0001;
      $display("Subtraction : %b - %b = %b",a,b,s);
      //#10 a=4'b1000; b=4'b0001;
     // $display("Modulus : %b %% %b = %b",a,b,mo);
      #10 a=4'b1000; b=4'b0001;
      $display("division : %b / %b = %b",a,b,d);
      //2 relational operators
       #10 a=4'b1000; b=4'b0001;
      $display("greaterthan : %b > %b = %b",a,b,g);
       #10 a=4'b1000; b=4'b0001;
      $display("lessthan : %b < %b = %b",a,b,l);
       #10 a=4'b1000; b=4'b0001;
      $display("greater or equal : %b >= %b = %b",a,b,ge);
       #10 a=4'b1000; b=4'b0001;
      $display("less or equal : %b <= %b = %b",a,b,le);
      //3 equal operators
      #10 a=4'b1000; b=4'b0001;
      $display("equal : %b == %b = %b",a,b,eq);
       #10 a=4'b1000; b=4'b0001;
      $display("notequal : %b != %b = %b",a,b,neq);
       #10 a=4'b1000; b=4'b0001;
      $display("case equal : %b === %b = %b",a,b,ca_eq);
       #10 a=4'b1000; b=4'b0001;
      $display("case notequal : %b !== %b = %b",a,b,ca_neq);
      //logical operators
      #10 a=4'b1000; b=4'b0001;
      $display("logic_and : %b && %b = %b",a,b,logic_and);
      #10 a=4'b1000;b=4'b0001;
      $display("logic_not : %b ! %b = %b",a,b,logic_not);
      //bitwise operators
      #10 a=4'b1000; b=4'b0001;
      $display("bit_and : %b & %b = %b",a,b,bit_and);
      //shift operators
      #10 a=4'b1000;
      $display("shi_r : %b >> 1 = %b",a,sh_r); 
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
