`default_nettype none

module clock_counter
#(
    parameter COUNTER_BITS = 4
)
(
    input clk,
    input reset,
    output reg [COUNTER_BITS - 1:0] counter_out
);
    reg [COUNTER_BITS - 1:0] count = 0;

    always @ (posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            count <= 0;
        end else begin
            count <= count + 1;
        end
        counter_out <= count;
    end

endmodule
