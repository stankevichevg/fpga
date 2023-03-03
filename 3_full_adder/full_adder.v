`default_nettype none

module full_adder
(
    input [2:0] in,
    output [1:0] out
);

    wire a;
    wire b;
    wire c_in;
    wire a_xor_b;
    
    assign a = in[0];
    assign b = in[1];
    assign c_in = in[2];
    
    // Create intermediate wire (net)
    assign a_xor_b = a ^ b;

    // Create output logic
    assign out[0] = a_xor_b ^ c_in;
    assign out[1] = (a_xor_b & c_in) | (a & b);

endmodule