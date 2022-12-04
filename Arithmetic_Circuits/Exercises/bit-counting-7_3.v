// A structural implementation for a bit counter 
// using FAs to count the number of ones on a 7-bit input
module count_73(in,count)
    // 7 input bits to count
    input [6:0] in;

    // 3-bit output counting ones on input
    output [2:0] count;

    wire s_0; wire co_0;
    wire s_1; wire co_1;
    wire s_2; wire co_2;
    wire s_3; wire co_3;
    wire s_4; wire co_4;
    wire s_5; wire co_5;
    

    // Structural instantiations and connections of adders
    // Specified in the block diagram included with this file
    FA f0(in[2],in[1],in[0],s_0,co_0);
    FA f1(in[4],in[3],1'b0,s_1,co_1);
    FA f2(in[6],in[5],1'b0,s_2,co_2);
    FA f3(s_0,s_1,s_2,s_3,co_3);
    FA f4(co_0,co_3,1'b0,s_4,co_4);
    FA f5(co_1,co_2,1'b0,s_5,co_5);

    

    // Assign output bits

    // MSB is high when there's a four by an path,
    // Either carry-out of stage two adders or both
    // sum outputs are high at once
    assign out[2] = (co_5 | co_4 | (s_4 & s_5));

    // There's a two if only one of the stage two
    // sums is one, other is zero
    assign out[1] = s_4 ^ s_5;

    assign out[0] = s_3;

endmodule
