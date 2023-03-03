module full_adder_test();
  reg clk = 0;
  reg [2:0] in;
  wire [1:0] out;

  full_adder fa(
    in,
    out
  );

  always
    #1  clk = ~clk;

  initial begin
    $display("Starting Full Adder");
    // $monitor("LED Value %b", led);
    #32 in = 3'b000;
    #32 in = 3'b001;
    #32 in = 3'b010;
    #32 in = 3'b100;
    #32 in = 3'b011;
    #32 in = 3'b101;
    #32 in = 3'b110;
    #32 in = 3'b111;
    #1000 $finish;
  end

  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_test);
  end
endmodule