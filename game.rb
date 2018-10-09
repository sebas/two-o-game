class Game
  attr_reader :play

  def initialize
    @play = true
    @turn = 1
    @player1 = Player.new
    @player2 = Player.new
    while (@play)
      while (@player1.lives > 0 && @player2.lives > 0)
        if @turn == 1
          playerTurn @player1
          playersStatus
          @turn = 2
        else
          playerTurn @player2
          playersStatus
          @turn = 1
        end
      end
      whoWon
      anotherGame
    end
  end

  def whoWon
    if @player1.lives > 0
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    else
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    end
  end

  def playerTurn(player)
    q = Question.new
    q.generateQuestion
    puts "Player#{@turn} What does #{q.firstNumber} plus #{q.secondNumber}"
    choice = $stdin.gets.chomp
    if q.evaluateQuestion choice
      puts "Correct"
    else
      puts "Incorrect"
      player.lostLive
    end
  end

  def playersStatus
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def anotherGame
    puts "Do you want to play another game?"
    choice = $stdin.gets.chomp
    if choice == "Y"
      @play = true
    elsif choice == "N"
      @play = false
    end
  end
end
