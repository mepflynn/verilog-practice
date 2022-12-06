// 8-bit Ripple Carry Adder - Various implementations

// Simple behavioral
module RCA(a,b,ci,s);
    // inputs
    input [7:0] a;
    input [7:0] b;
  	input ci;

    //outputs
    output [8:0] s;

    assign s = a + b + ci;

endmodule

// Structural definition via a series of Full Adders
module RCA(a,b,ci,s);
    // inputs
    input [7:0] a;
    input [7:0] b;
    input ci;

    //outputs
    output [8:0] s;

    wire [6:0] carry;

    // FA Instantiations
    FA f0(a[0], b[0], ci, s[0], carry[0]);
    FA f1(a[1] ,b[1], carry[1], s[1], carry[2]);
    FA f2(a[2] ,b[2], carry[2], s[2], carry[3]);
    FA f3(a[3] ,b[3], carry[3], s[3], carry[4]);
    FA f4(a[4] ,b[4], carry[4], s[4], carry[5]);
    FA f5(a[5] ,b[5], carry[5], s[5], carry[6]);
    FA f6(a[6] ,b[6], carry[6], s[6], carry[7]);
    FA f7(a[7] ,b[7], carry[7], s[7], s[8]);


endmodule