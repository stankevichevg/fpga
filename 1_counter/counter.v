module counter
(
    input clk,
    input btn1,
    input btn2,
    output [5:0] led
);

localparam WAIT_TIME = 13500000;
reg [5:0] ledCounter = 0;
reg [23:0] clockCounter = 0;

always @(posedge clk) begin
    if (!btn1) begin
        clockCounter <= 0;
        ledCounter <= 0;
    end
    if (!btn2) begin
        clockCounter <= 0;
        ledCounter <= 63;
    end
    clockCounter <= clockCounter + 1;
    if (clockCounter == WAIT_TIME) begin
        clockCounter <= 0;
        ledCounter <= ledCounter + 1;
    end
end

assign led = ~ledCounter;
endmodule