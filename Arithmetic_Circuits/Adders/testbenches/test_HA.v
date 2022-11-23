module test_HA;
    // Declare I/O Signals for DUT
    // Combine the two inputs for ease of cycling through cases
    reg [1:0] ab;
    
    wire s;
    wire c;

    // Instantiate DUT
    HA h0(ab[1],ab[0],s,c);

    // Excite through all states, check against software addition on signal ref
    reg [1:0] ref;
    initial begin
        ab = 2'd0;
        ref = 2'd0;

        repeat(4) begin
            #100
            // Note that we add the bits of ref separately, as they are both weighted 1 (the 0th order bit)
            if ({c,s} !== (ref[1] + ref[0])) begin
                // Error detected!
                $display("Error: Output = %b, reference = %b",{c,s},ref);
            end
            ab = ab + 1;
            ref = ref + 1;
        end
    end
endmodule


module test_HA_Assertion;
    // Declare I/O Signals for DUT
    // Combine the two inputs for ease of cycling through cases
    reg [1:0] ab;
    
    wire s;
    wire c;

    // Instantiate DUT
    HA h0(ab[1],ab[0],s,c);

    // Excite through all states, check against software addition on signal ref
  	reg [1:0] x;
    initial begin
        ab = 2'd0;
        x = 2'd0;

        repeat(4) begin
            #100
            // Note that we add the bits of ref separately, as they are both weighted 1 (the 0th order bit)
          SUMeqX: assert ({c,s} == (x[1] + x[0])) $display("OK. Sum = reference.");
          	else $error("Error: Output Mismatch");

            ab = ab + 1;
            x = x + 1;
        end
    end
endmodule