// This is a manual test, where the user must look at full output to verify correctness
module test_mult_of_five;

    reg [4:0] in;
    wire ismultiple;

    initial begin
        in = 0;

        repeat(32) begin
            #100

            if (ismultiple === 1'b1) $display("%d is a multiple of 5",in);

            in = in + 1;
        end
    end

endmodule
