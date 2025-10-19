///FIFO :-
module fifo(clk,reset,wr_en,rd_en,wr_data,rd_data,full,empty,wr_ptr,rd_ptr);
  input wire clk,reset,wr_en,rd_en;
  input wire [7:0]wr_data;
  output reg [7:0]rd_data;
  output reg full,empty;
  output reg [3:0]wr_ptr,rd_ptr;
  
  reg [7:0] mem [15:0];
  
  always@(posedge clk)
    begin
      if (reset)
        begin
          rd_data=1'b0;
          full=1'b0;
          empty=1'b1;
          wr_ptr=1'b0;
          rd_ptr=1'b0;
        end
      else
        begin
          if(wr_en&&!full)
            mem[wr_ptr]<=wr_data;
          wr_ptr=wr_ptr+1;
        end
      if(rd_en&&empty)
        begin
          rd_data<=mem[rd_ptr];
          rd_ptr=rd_ptr+1;
        end
      if(wr_ptr==15)
        begin
          rd_ptr<=1'b0;
          rd_ptr=rd_ptr+1;
        end
    end
endmodule

///TESTBENCH:-

module tb;
  reg clk,reset,wr_en,rd_en;
  reg [7:0]wr_data;
  wire [7:0]rd_data;
  wire full,empty;
  
  always #2 clk=~clk;
  fifo dut(.clk(clk),.reset(reset),.wr_en(wr_en),.rd_en(rd_en),.wr_data(wr_data),.rd_data(rd_data),.full(full),.empty(empty),.wr_ptr(wr_ptr),.rd_ptr(rd_ptr));
  
  initial
    begin
      $monitor($time,"clk=%0b,reset=%0b,wr_en=%0b,rd_en=%0b,wr_data=%0b,rd_data=%0b,full=%0b,empty=%0b,wr_ptr=%0b,rd_ptr=%0b",clk,reset,wr_en,rd_en,wr_data,rd_data,full,empty,wr_ptr,rd_ptr);
      
      #2 reset=1'b1;
      clk=1'b0;
      wr_en=1'b0;
      rd_en=1'b0;
      wr_data=8'b00000000;
      
      
      #4 reset=1'b0;
      clk=1'b1;
      wr_en=1'b1;
      rd_en=1'b1;
      wr_data=8'b10101010;
      
      
      #4 reset=1'b0;
      clk=1'b1;
      wr_en=1'b1;
      rd_en=1'b1;
      wr_data=8'b01010101;
      
      
      #4 reset=1'b0;
      clk=1'b1;
      wr_en=1'b1;
      rd_en=1'b1;
      wr_data=8'b10101010;
      #200 $finish;
      
      
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
