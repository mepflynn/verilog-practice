module primes_case(in, isprime);
    input [3:0] in;  // 4bit (0-15 dec) input
    output isprime; // logic 1 if in[] is prime, else 0

    reg isprime;    // Redeclare as reg for use with case statement

    always @(in) begin
        case (in)
            1,2,3,5,7,11,13: isprime = 1'b1;
            default:         isprime = 1'b0;
        endcase
    end

endmodule

module primes_casex(in, isprime);
    input [3:0] in;
    output isprime;

    reg isprime;

    always @(in) begin
        casex (in)
             4'b0xx1, 4'bx011, 4'b001x, 4'bx101: isprime = 1'b1;
             default:                        isprime = 1'b0;
        endcase
    end
endmodule