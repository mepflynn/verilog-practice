module test_mux_manual;

    parameter k = 2;

    reg [k-1:0] a2;
    reg [k-1:0] a1;
    reg [k-1:0] a0;
    reg [2:0] s;

    wire [k-1:0] b;

    // Instantiate UUTs
    mux_31_case #(k) m1(a2,a1,a0,s,b);

    initial begin
        s = 0; // Start selector bit as 0, loop it through all 8 combos

        // Fully loop through all input states (All states of s, a0, a1, a2)
        repeat(8) begin
            a2 = {k{1'b0}}; a1 = {k{1'b0}}; a0 = {k{1'b0}};

            $display("Select signal = %b",s);
            $display(" a2  | a1  | a0  | b");

            repeat(8) begin
                repeat(8) begin
                    repeat(8) begin
                        // Center of all loops, display I/O state after logic settles
                        #100

                        $display(" %b | %b | %b | %b",a2,a1,a0,b);

                        a0 = a0 + 1;
                    end
                    a1 = a1 + 1;
                end
                a2 = a2 + 1;
            end

            s = s + 1;
        end
    end

endmodule




