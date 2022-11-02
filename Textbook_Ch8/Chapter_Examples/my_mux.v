// This module has undefined behavior when the selector signal S is not in proper one-hot code
// See the case-statment implementation for situations where this situation may occur
module mux_31_assign(a2,a1,a0,s,b);
    parameter k = 1;

    input [k-1:0] a2;
    input [k-1:0] a1;
    input [k-1:0] a0;
    input [2:0] s;

    output [k-1:0] b;

    assign b = (a2 & {k{s[2]}}) | (a1 & {k{s[1]}}) | (a0 & {k{s[0]}});

endmodule


// Outputs k'bx when given invalid (non-one-hot) input on selector signal 's'
module mux_31_case(a2,a1,a0,s,b);
    parameter k = 1;

    input [k-1:0] a2;
    input [k-1:0] a1;
    input [k-1:0] a0;
    input [2:0] s;

    output [k-1:0] b;

    reg [k-1:0] b;

    always @(*) begin
        case(s)
            3'b001: b = a0;
            3'b010: b = a1;
            3'b100: b = a2;
            default: b = {k{1'bx}}; // Given invalid (non-one-hot) input on s, output K-wide don't-cares
        endcase
    end
endmodule

