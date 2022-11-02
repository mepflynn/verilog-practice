module test_barrel_shifter_manual;
    
    // I/O Signals to excite UUT (expecting #(8,3) parameters)
    reg [7:0] a;
    reg [2:0] n;
    wire [7:0] b;

    // Declare UUT w/ default params 8,3
    barrel_shifter b0(a,n,b);

    initial begin
        a = 0; n = 0;

        #100
        $display("Initial state: all zeros\n a       | n  | b\n%b | %b | %b",a,n,b);
        
        // Set a = 00001111
        a = 8'h0f;
        #100
        $display("Set a = 00001111\n a       | n  | b\n%b | %b | %b",a,n,b);
        
        // Shift 00001111 2 left -> 00111100
        n = 3'b010;     
        #100
        $display("Set n = 2, shift 2 left\n a       | n  | b\n%b | %b | %b",a,n,b);
        
    end

endmodule