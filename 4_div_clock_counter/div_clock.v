`default_nettype none

module div_clock
#(
    parameter DELAY = 6000000
)
(
    input clk_in,
    input reset,
    output reg clk_out
);

    reg divided_clk = 0;
    reg [31:0] count = 32'b0;

    always @ (posedge clk_in or posedge reset) begin
        if (reset == 1'b1) begin
            count <= 32'b1;
            divided_clk <= 0;
        end else if (count == DELAY) begin
            count <= 32'b1;
            if (divided_clk == 0) begin
                divided_clk <= 1;
            end else begin
                divided_clk <= 0;
            end
        end else begin
            count <= count + 1;
        end
        clk_out <= divided_clk;
    end

endmodule
