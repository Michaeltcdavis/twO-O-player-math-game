class Game
  attr_accessor :player1, :player2
  attr_reader :turn

  def initialize
    @turn = 0
    puts "Welcome to the Game!"
    assign_players
    play_game
  end

  private

  def assign_players
    puts "Player 1, what is your name?"
    player1_name = gets.chomp
    puts "Player 2, what is your name?"
    player2_name = gets.chomp
    @player1 = Player.new player1_name
    @player2 = Player.new player2_name
  end

  def increment_turn
    @turn += 1
  end

  def check_player
    return player1 if turn % 2 == 0
    return player2
  end

  def play_game 
    until player1.lives < 1 || player2.lives < 1 do #could check current player score
      ask_question
    end
    return declare_winner player1 if player1.lives > 0
    return declare_winner player2
  end

  def ask_question
    current_player = check_player
    puts "It's turn #{turn}! That's #{current_player.name}'s turn"
    new_question = Question.new
    if new_question.result == false 
      current_player.remove_life 
      puts "uh oh! That is incorrect."
    end
    puts "#{player1.name}'s lives: #{player1.lives}/3 vs #{player2.name}'s lives: #{player2.lives}/3"
    increment_turn
  end

  def declare_winner winner
    puts "#{winner.name} has won with a score of #{winner.lives}/3", "Thanks for playing!"
  end
    
end
