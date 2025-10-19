///8 TO 3 ENCODER - Complete Implementation
/// Priority encoder converts 8-bit one-hot input to 3-bit binary output
/// Uses casex to handle priority encoding (highest priority bit wins)
/// Real-world applications: Interrupt controllers, priority arbitration, keyboard scanning

module encoder(data,out);
  // Input port: 8-bit one-hot input with priority encoding
  input wire[7:0] data;       // 8-bit input (data[7] has highest priority)
  
  // Output port: 3-bit binary equivalent
  output reg [2:0] out;       // Binary output (out[2] is MSB, out[0] is LSB)
  
  // Combinational logic: Priority encoding using casex for don't-care conditions
  always@(*)                  // Executes whenever input changes
    begin
      casex({data})           // Check input with don't-care conditions
      8'b00000001: out = 3'b000;  // Only data[0] active: Output 000
      8'b0000001x: out = 3'b001;  // data[1] active (ignore data[0]): Output 001
      8'b000001xx: out = 3'b010;  // data[2] active (ignore lower bits): Output 010
      8'b00001xxx: out = 3'b011;  // data[3] active (ignore lower bits): Output 011
      8'b0001xxxx: out = 3'b100;  // data[4] active (ignore lower bits): Output 100
      8'b001xxxxx: out = 3'b101;  // data[5] active (ignore lower bits): Output 101
      8'b01xxxxxx: out = 3'b110;  // data[6] active (ignore lower bits): Output 110
      8'b1xxxxxxx: out = 3'b111;  // data[7] active (ignore lower bits): Output 111
      default: out = 3'bxxx;      // No input active: Output undefined
      endcase
  end
endmodule

///TEST BENCH:-
module tb;
   reg [7:0] data;
   wire [2:0] out;
  encoder dut(.data(data),.out(out));
  initial  begin
      $monitor($time,"data=%0b,out=%0b",data,out);
       #10 data=8'b00000001;
       #10 data=8'b0000001x;
       #10 data=8'b000001xx;
       #10 data=8'b00001xxx;
       #10 data=8'b0001xxxx;
       #10 data=8'b001xxxxx;
       #10 data=8'b01xxxxxx;
       #10 data=8'b1xxxxxxx;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
endmodule
