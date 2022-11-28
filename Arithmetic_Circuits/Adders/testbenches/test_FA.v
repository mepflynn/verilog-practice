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

    // Excite through all states, check against software addition on signal ref
    reg [2:0] ref;
    initial begin
        in = 3'd0;
        ref = 3'd0;

        repeat(8) begin
            #100
            // Note that we add the bits of ref separately, as they are both weighted 1 (the 0th order bit)
            if ({1'b0,co,s} !== (ref[2] + ref[1] + ref[0])) begin
                // Error detected!
                $display("Error: Output = %b, reference = %b",{co,s},ref);
            end else begin 
                $display("In: %b | Out: %b | Ref: %b | Sum: %b",in,{1'b0,co,s},ref);
            end
            in = in + 1;
            ref = ref + 1;
        end
    end
endmodule
