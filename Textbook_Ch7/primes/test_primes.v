module test_primes_case;

    // Declare I/O for module under test
    reg [3:0] in;
    wire isprime;

    // Instantiate module under test
    primes_case p0(in, isprime);

    initial begin
        in = 0;

        repeat(16) begin
            #100
            $display("On input %d, isprime is: %b",in,isprime);
            in = in + 1;
        end

    end

endmodule


module test_primes_compare;
    reg [3:0] in;
    wire isprime0;
    wire isprime1;

    reg check;

    primes_case p0(in, isprime0);
    primes_casex p1(in, isprime1);

    initial begin
        

        // Initial values
        in = 0; check = 0;

        // Loop through all input combinations
        repeat(16) begin
            #100
            if (isprime0 !== isprime1) check = 1'b1;

            in = in + 1;
        end

        if (check == 1'b1) $display("Error: Output mismatch detected.");
        else $display("Outouts matched fully, exiting.");

    end
endmodule