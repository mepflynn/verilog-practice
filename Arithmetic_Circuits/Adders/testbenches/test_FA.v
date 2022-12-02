module test_FA;
    // Declare I/O Signals for DUT
    // reg a;
    // reg b;
    // reg ci;
    reg [2:0] in; // (in = {a,b,ci})
    
    wire s;
    wire co;

    // Instantiate DUT
    FA f0(in[2],in[1],in[0],s,co);

    // Excite through all states, check against software addition on signal ref_sum
    reg [2:0] ref_sum;
    initial begin
        in = 3'd0;
        ref_sum = 3'd0;

        repeat(8) begin
            #100
            // Note that we add the bits of ref_sum separately, as they are both weighted 1 (the 0th order bit)
            if ({1'b0,co,s} !== (ref_sum[2] + ref_sum[1] + ref_sum[0])) begin
                // Error detected!
                $display("Error: Output = %b, ref_sum = %b",{co,s},ref_sum);
            end else begin 
                $display("In: %b | Out: %b | ref_sum: %b | Sum: %b",in,{1'b0,co,s},ref_sum);
            end
            in = in + 1;
            ref_sum = ref_sum + 1;
        end
    end
endmodule
