// Full Adder
module FA(a,b,ci,s,co);
    input a;
    input b;
    input ci;

    // Sum (LSB) and carry-out (MSB) of the the overall sum
    output s;
    output co;

    assign s = a ^ b ^ ci;

    assign co = (a & b) | (b & ci) | (a & ci);
endmodule


    