// This testbench doesn't comprise an exhaustive test
// Rather, it runs 16 times on numbers all 0's except for the leading 1 to be detected
// How would I implement an exhaustive test for this module efficiently?
//         -> comparison strategy?
module test_find_first_one;

    reg [15:0] in;
    wire [3:0] one_pos;
    wire no_ones;


    // instantiate UUT
    find_first_one f0(in,one_pos,no_ones);

    initial begin
        in = 16'h8000; // This represents a one followed by 15 zeros in binary

        // Output identification columns, spaced out to line up well with output
        $display("Input            | one_pos | no_ones");

        // Take 8000hex, bitshift 16 times to represent having a leading one in each position
        repeat(16) begin
            #100

            // Show each state of input/outputs
            $display("%b |   %d   | %b",in,one_pos,no_ones);

            in = in >> 1; // bit shift one right with zero-fill
        end

        // Manually run the 0-input case
        in = 0;
        #100
        $display("%b |   %d   | %b",in,one_pos,no_ones); 

    end

endmodule


