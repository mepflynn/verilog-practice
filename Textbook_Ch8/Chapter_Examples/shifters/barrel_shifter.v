module barrel_shifter(a,n,b);
    // width of number to shift
    parameter w = 8;
    // width for the shift count, n
    parameter nw = 3;

    // I/O Declarations
    input [w-1:0] a;
    input [nw-1:0] n;
    output [w-1:0] b;

    // Internal signals
    // temp wire must be double wide to accomodate left-shifting bit width
    // we will pull the wrap-around values out of this extra width
    wire [2*w-2:0] temp;

    // Shift a, deposit into temp
    assign temp = a << n;

    // Assign b = (low half of temp) OR (high half of temp) thereby wrapping in the shifted-out vals
    assign b = temp[w-1:0] | {1'b0,temp[2*w-2:w]}

endmodule