`timescale 1ns/1ps
module mult_system_tb;
    reg clk = 0, rst = 1, start = 0;
    wire done;
    integer i;

    mult_system uut (clk, rst, start, done);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;
        #10 start = 1;
        #10 start = 0;

        wait (done);
        #10;
        for (i = 0; i < 4; i = i + 1)
            $display("RAM[%0d] = %0d", i, uut.ram.mem[i]);

        $writememh("ram_out.txt", uut.ram.mem);
        $finish;
    end
endmodule
