module find_first_one(in, one_pos, no_ones);
    input [15:0] in;
    output [3:0] one_pos;
    output no_ones;

    // Redeclare as reg for casex usage
    reg [3:0] one_pos;
    reg no_ones;

    always @(in) begin
        casex(in)
            16'b1xxxxxxxxxxxxxxx: {one_pos,no_ones} = 5'b11110;
            16'bx1xxxxxxxxxxxxxx: {one_pos,no_ones} = 5'b11100;
            16'bxx1xxxxxxxxxxxxx: {one_pos,no_ones} = 5'b11010;
            16'bxxx1xxxxxxxxxxxx: {one_pos,no_ones} = 5'b11000;
            16'bxxxx1xxxxxxxxxxx: {one_pos,no_ones} = 5'b10110;
            16'bxxxxx1xxxxxxxxxx: {one_pos,no_ones} = 5'b10100;
            16'bxxxxxx1xxxxxxxxx: {one_pos,no_ones} = 5'b10010;
            16'bxxxxxxx1xxxxxxxx: {one_pos,no_ones} = 5'b10000;
            16'bxxxxxxxx1xxxxxxx: {one_pos,no_ones} = 5'b01110;
            16'bxxxxxxxxx1xxxxxx: {one_pos,no_ones} = 5'b01100;
            16'bxxxxxxxxxx1xxxxx: {one_pos,no_ones} = 5'b01010;
            16'bxxxxxxxxxxx1xxxx: {one_pos,no_ones} = 5'b01000;
            16'bxxxxxxxxxxxx1xxx: {one_pos,no_ones} = 5'b00110;
            16'bxxxxxxxxxxxxx1xx: {one_pos,no_ones} = 5'b00100;
            16'bxxxxxxxxxxxxxx1x: {one_pos,no_ones} = 5'b00010;
            16'bxxxxxxxxxxxxxxx1: {one_pos,no_ones} = 5'b00000;
            default: {one_pos,no_ones} = 5'bxxxx1;
        endcase
    end
    endmodule

