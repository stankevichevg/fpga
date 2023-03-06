module div_clock_test();
  reg clk = 0;
  reg rst = 0;
  wire clk_out;

  wire [3:0] counter;

  div_clock #(5) dc
  (
    clk,
    rst,
    clk_out
  );

  clock_counter #(4) cc
  (
    clk_out,
    rst,
    counter
  );

  always
    #1  clk = ~clk;

  initial begin
    $display("Starting Div Clock Test");
    // $monitor("Div Clock %b", clk_out);
    #13 rst = 1;
    #21 rst = 0;
    #501 rst = 1;
    #523 rst = 0;
    #1000 $finish;
  end

  initial begin
    $dumpfile("div_clock.vcd");
    $dumpvars(0, div_clock_test);
  end
endmodule