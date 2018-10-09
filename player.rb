class Player
  attr_reader :lives

  def initialize
    @lives = 3
  end

  def lostLive
    @lives = @lives - 1
  end

  def playerAlive
    if @lives > 0
      true
    else
      false
    end
  end
end