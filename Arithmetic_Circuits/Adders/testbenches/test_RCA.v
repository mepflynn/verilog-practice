module test_RCA;

    // I/O signals
    reg [7:0] a;
    reg [7:0] b;
    reg ci;

    wire [8:0] s;

    
    // DUT
    RCA r0(a,b,ci,s);

    reg [8:0] ref_s;

    initial begin
        a = 8'd0; b = 8'd0;

        repeat(128) begin
            repeat(128) begin
                // Run a reference sum in software
                ref_s = a + b + ci;

                // Check correctness against reference
                if (ref_s !== s) begin
                    $display("Error: sum is %b | ref_sum is %b | inputs are a = %b b = %b",s,ref_s,a,b);
                end

                b = b + 1;
            end
            a = a + 1;
        end

    end
endmodule