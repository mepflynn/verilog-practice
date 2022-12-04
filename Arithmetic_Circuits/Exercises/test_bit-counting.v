module test_bit-counting;
    // 7 input bits to count
    reg [6:0] in;

    // 3-bit output counting ones on input
    wire [2:0] count;


    // Internal test signals
    reg [2:0] reference_count;

    initial begin
        in = 7'd0;
        repeat(128) begin
            reference_count = in[6] + in[5] + in[4] + in[3] + in[2] + in[1] + in[0];

            if (reference_count !== count) begin
                $display("ERROR: in %b | count %b | ref_count %b");
            end else begin
                $display("GOOD: in %b | count %b | ref_count %b")
            end

            in = in + 1;
        end
        
    end




endmodule
