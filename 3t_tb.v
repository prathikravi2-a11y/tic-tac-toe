`timescale 1ns/1ps

module tb_tic_tac_toe;

    reg clk;
    reg reset;
    reg [3:0] cell_select;
    reg place;

    wire current_player;
    wire game_over;
    wire [1:0] winner;

    // Instantiate the DUT (Device Under Test)
    tic_tac_toe uut (
        .clk(clk),
        .reset(reset),
        .cell_select(cell_select),
        .place(place),
        .current_player(current_player),
        .game_over(game_over),
        .winner(winner)
    );
    initial begin
        $dumpfile("3t_tb.vcd");
        $dumpvars(0,3t_tb.v);
    end

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        place = 0;
        cell_select = 0;

        // Apply reset
        #10;
        reset = 0;

        // -------- Game sequence --------
        // Player X -> cell 0
        #10 cell_select = 0; place = 1;
        #10 place = 0;

        // Player O -> cell 3
        #10 cell_select = 3; place = 1;
        #10 place = 0;

        // Player X -> cell 1
        #10 cell_select = 1; place = 1;
        #10 place = 0;

        // Player O -> cell 4
        #10 cell_select = 4; place = 1;
        #10 place = 0;

        // Player X -> cell 2 (X wins)
        #10 cell_select = 2; place = 1;
        #10 place = 0;

        // Wait and observe result
        #20;

        // End simulation
        $stop;
    end

endmodule