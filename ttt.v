module tic_tac_toe (
    input clk,
    input reset,
    input [3:0] cell_select,
    input place,

    output reg current_player,
    output reg game_over,
    output reg [1:0] winner
);

    reg [1:0] board [0:8];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 9; i = i + 1)
                board[i] <= 2'b00;

            current_player <= 1'b0;
            game_over <= 1'b0;
            winner <= 2'b00;
        end
        else if (place && !game_over) begin
            if (board[cell_select] == 2'b00) begin
                board[cell_select] <= current_player ? 2'b10 : 2'b01;
                current_player <= ~current_player;
            end
        end
    end

    always @(*) begin
        winner = 2'b00;
        game_over = 1'b0;

        if (board[0] != 0 && board[0] == board[1] && board[1] == board[2])
            winner = board[0];
        else if (board[3] != 0 && board[3] == board[4] && board[4] == board[5])
            winner = board[3];
        else if (board[6] != 0 && board[6] == board[7] && board[7] == board[8])
            winner = board[6];

        else if (board[0] != 0 && board[0] == board[3] && board[3] == board[6])
            winner = board[0];
        else if (board[1] != 0 && board[1] == board[4] && board[4] == board[7])
            winner = board[1];
        else if (board[2] != 0 && board[2] == board[5] && board[5] == board[8])
            winner = board[2];

        else if (board[0] != 0 && board[0] == board[4] && board[4] == board[8])
            winner = board[0];
        else if (board[2] != 0 && board[2] == board[4] && board[4] == board[6])
            winner = board[2];

        if (winner != 2'b00)
            game_over = 1'b1;
    end
endmodule



