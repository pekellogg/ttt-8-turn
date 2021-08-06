# display current board state
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# control flow method
# prompt user for input, update board if valid move then display updated board state
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)
    if valid_move?(board, input)
        move(board, input, player = "X")
        display_board(board)
    else
        turn(board)
    end
end

# convert input
def input_to_index(input)
    input = input.to_i - 1
end

# checks that position is not taken and input between 0, 8 inclusively
def valid_move?(board, input)
    position_taken?(board, input) == false && input.between?(0, 8) ? true : false
end

# updates board
def move(board, input, player = "X")
    board[input] = player
end

# position is !taken if == "", " ", nil
def position_taken?(board, input)
    i = board[input]
    i == "" || i == " " || i == nil ? false : true
end