module mult_of_five(in, ismultiple);
    input [4:0] in;
    output ismultiple;

    reg ismultiple;

    // Instantiate mod under test
    mult_of_five m0(in, ismultiple);


    always @(in) begin
        case(in)
            5,10,15,20,25,30: ismultiple = 1'b1;
            default: ismultiple = 1'b0;
        endcase
    end
endmodule
