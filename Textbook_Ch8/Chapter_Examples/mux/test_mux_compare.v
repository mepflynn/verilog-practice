module test_mux_compare;

    parameter k = 2;

    reg [k-1:0] a2;
    reg [k-1:0] a1;
    reg [k-1:0] a0;
    reg [2:0] s;

    wire [k-1:0] b0;
    wire [k-1:0] b1;

    // Instantiate UUTs
    mux_31_assign #(k) m0(a2,a1,a0,s,b0);
    mux_31_case #(k) m1(a2,a1,a0,s,b1);

    // Testing variables
    reg check;

    initial begin
        s = 0; // Start selector bit as 0, loop it through all 8 combos
        check = 1'b0;
        
        // Fully loop through all input states (All states of s, a0, a1, a2)
        repeat(8) begin
            a2 = {k{1'b0}}; a1 = {k{1'b0}}; a0 = {k{1'b0}};

            repeat(8) begin
                repeat(8) begin
                    repeat(8) begin
                        // Center of all loops, check here for correctness after logic settles
                        #100

                        if(b0 !== b1) begin
                            check = 1'b1;
                            $display("Error: b0 = %b | b1 = %b",b0,b1);
                        end

                        a0 = a0 + 1;
                    end
                    a1 = a1 + 1;
                end
                a2 = a2 + 1;
            end

            s = s + 1;
        end

        if (check == 1'b1) $display("Output mistmatch(es) found, exiting.");
        else $display("Outputs fully matched, exiting.");

    end

endmodule




