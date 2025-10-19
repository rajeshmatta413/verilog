///FIFO (First In, First Out) Buffer - Complete Implementation
/// FIFO is a queue data structure used for data buffering in communication systems
/// Real-world applications: UART buffers, network packet queues, audio/video streaming

module fifo(clk,reset,wr_en,rd_en,wr_data,rd_data,full,empty,wr_ptr,rd_ptr);
  // Input ports: Control and data signals
  input wire clk;              // Clock signal for synchronous operation
  input wire reset;             // Reset signal to initialize FIFO
  input wire wr_en;             // Write enable signal
  input wire rd_en;             // Read enable signal  
  input wire [7:0]wr_data;     // 8-bit data to be written
  
  // Output ports: Data and status signals
  output reg [7:0]rd_data;     // 8-bit data to be read
  output reg full;             // FIFO full status flag
  output reg empty;            // FIFO empty status flag
  output reg [3:0]wr_ptr;     // Write pointer (4-bit for 16 locations)
  output reg [3:0]rd_ptr;     // Read pointer (4-bit for 16 locations)
  
  // Internal memory: 16 locations of 8-bit data each (128 bits total)
  reg [7:0] mem [15:0];        // Memory array: 16 locations × 8 bits
  
  // Sequential logic block - executes on rising clock edge
  always@(posedge clk)
    begin
      // RESET LOGIC: Initialize all signals and pointers
      if (reset)
        begin
          rd_data <= 8'b0;     // Clear read data output
          full <= 1'b0;        // FIFO is not full initially
          empty <= 1'b1;       // FIFO is empty initially
          wr_ptr <= 4'b0;      // Reset write pointer to location 0
          rd_ptr <= 4'b0;      // Reset read pointer to location 0
        end
      else
        begin
          // WRITE OPERATION: Write data if enabled and FIFO not full
          if(wr_en && !full)   // Write only if enabled and space available
            mem[wr_ptr] <= wr_data;  // Store data at current write pointer location
          wr_ptr <= wr_ptr + 1;      // Always increment write pointer (circular)
        end
      
      // READ OPERATION: Read data if enabled and FIFO not empty
      if(rd_en && !empty)     // Read only if enabled and data available
        begin
          rd_data <= mem[rd_ptr];    // Output data from current read pointer location
          rd_ptr <= rd_ptr + 1;      // Increment read pointer (circular)
        end
      
      // POINTER WRAPAROUND: Reset pointers when they reach maximum value
      if(wr_ptr == 15)         // When write pointer reaches last location
        begin
          rd_ptr <= 4'b0;      // Reset read pointer to beginning
          rd_ptr <= rd_ptr + 1; // Increment read pointer
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
