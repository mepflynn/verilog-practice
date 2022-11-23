// Half adder
// Two 1-bit inputs, output of magnitude 2'd0-2

module HA(a,b,s,c);
    // Two 1-bit summands
    input a;
    input b;

    // Sum (LSB) and carry (MSB)
    output s;
    output c;

    assign s = a ^ b;
    assign c = a & b;
endmodule