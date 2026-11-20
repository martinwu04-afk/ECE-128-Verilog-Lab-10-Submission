// 4x4 combinational (array) multiplier: P = A * B
module mult4x4 (input  wire [3:0] A, input  wire [3:0] B, output wire [7:0] P);
    wire [7:0] pp0 = {4'b0, A & {4{B[0]}}};
    wire [7:0] pp1 = {3'b0, A & {4{B[1]}}, 1'b0};
    wire [7:0] pp2 = {2'b0, A & {4{B[2]}}, 2'b0};
    wire [7:0] pp3 = {1'b0, A & {4{B[3]}}, 3'b0};

    assign P = pp0 + pp1 + pp2 + pp3;
endmodule
