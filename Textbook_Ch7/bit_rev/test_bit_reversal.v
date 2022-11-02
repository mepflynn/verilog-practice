module test_bit_rev_manual;
    reg [4:0] in;
    wire [4:0] out;

    // Instiatiate UUT
    bit_rev_case b0(in,out);


    initial begin
        in = 0;
        repeat (32) begin
            #100

            $display("For the input %b, output is: %b",in,out);

            in = in + 1;
        end
    end

endmodule



module test_bit_rev_compare;
    reg [4:0] in;
    wire [4:0] out0;
    ire [4:0] out1;

    reg check;

    // Instiatiate UUTs
    bit_rev_case b0(in,out0);
    bit_rev_assign b1(in,out1);


    initial begin
        in = 0; check = 0;
        repeat (32) begin
            #100

            if (out0 !== out1) begin
                $display("Output mismatch on input %b, outputs are | %b | %b |",in,out0,out1);
                check = 1'b1
            end

            in = in + 1;
        end

        if (check == 1'b1) $display("Error: output mismatch detected");
        else $display("Outputs matched fully for all input");
    end

endmodule