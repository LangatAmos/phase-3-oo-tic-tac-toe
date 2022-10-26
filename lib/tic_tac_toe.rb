class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [0, 3, 6],
        [6, 7, 8],
        [0, 4, 8],
        [6, 4, 2],
        [1, 4, 7],
        [2, 5, 8]
    ]
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end
    def position_taken? index
        @board[index] == " " ? false : true
    end
    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end
    def turn_count
        @board.count do |box| 
            box != " "
        end
    end
    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Enter any number between 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |combination|
            if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
                return combination
            end
        end
    end

    def full?
        @board.all? do |box| 
            box != " "
        end
    end

    def draw?
        true if !won? && full?
    end

    def over?
        true if won? || draw?
    end

    def winner
        if combination = won?
            @board[combination[0]]
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
    end
end