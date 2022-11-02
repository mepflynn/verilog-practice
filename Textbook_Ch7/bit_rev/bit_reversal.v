module bit_rev_case(in, out);
    input [4:0] in;
    output [4:0] out;

    reg [4:0] out;

    always @(in) begin
        case(in)
            default: out = {in[0],in[1],in[2],in[3],in[4]};
        endcase
    end
endmodule


module bit_rev_assign(in, out);
    input [4:0] in;
    output [4:0] out;

    assign out = {in[0],in[1],in[2],in[3],in[4]};

endmodule