// Top level: ROM -> A,B registers -> multiplier -> RAM, run by the control unit
module mult_system (input wire clk, input wire rst, input wire start, output wire done);
    wire [2:0] rom_addr, ram_addr;
    wire       load_a, load_b, ram_we;
    wire [3:0] rom_data;
    wire [7:0] product, ram_dout;
    reg  [3:0] A, B;

    control_unit cu  (clk, rst, start, rom_addr, load_a, load_b, ram_we, ram_addr, done);
    Rom8x4       rom (rom_addr, 1'b1, rom_data);
    mult4x4      mul (A, B, product);
    Ram8x8       ram (clk, ram_we, ram_addr, product, ram_dout);

    always @(posedge clk) begin
        if (load_a) A <= rom_data;
        if (load_b) B <= rom_data;
    end
endmodule
