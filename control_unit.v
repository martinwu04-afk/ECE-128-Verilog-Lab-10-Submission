// Control unit (FSM): read A, read B, multiply, write result, repeat 4 times
module control_unit (input wire clk, input wire rst, input wire start, output reg [2:0] rom_addr, output reg load_a, output reg load_b, output reg ram_we, output reg [2:0] ram_addr, output reg done);
    parameter IDLE = 3'd0, READ_A = 3'd1, READ_B = 3'd2, MULT = 3'd3, WRITE  = 3'd4, FINISH = 3'd5;

    reg [2:0] state;
    reg [1:0] i;                       // pair counter: 0..3

    // state register and counter
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            i     <= 0;
        end else case (state)
            IDLE:   if (start) state <= READ_A;
            READ_A: state <= READ_B;
            READ_B: state <= MULT;
            MULT:   state <= WRITE;
            WRITE:  if (i == 3) state <= FINISH;
                    else begin i <= i + 1; state <= READ_A; end
            FINISH: state <= FINISH;
            default: state <= IDLE;
        endcase
    end

    // outputs for each state
    always @(*) begin
        rom_addr = 0; load_a = 0; load_b = 0;
        ram_we = 0; ram_addr = {1'b0, i}; done = 0;
        case (state)
            READ_A: begin rom_addr = {i, 1'b0}; load_a = 1; end  // A at address 2i
            READ_B: begin rom_addr = {i, 1'b1}; load_b = 1; end  // B at address 2i+1
            WRITE:  ram_we = 1;                                  // result to RAM address i
            FINISH: done = 1;
        endcase
    end
endmodule
