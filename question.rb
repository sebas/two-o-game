class Question
  attr_reader :firstNumber, :secondNumber

  def initialize
    @firstNumber = 0
    @secondNumber = 0
  end

  def generateQuestion
    @firstNumber = rand(1..20)
    @secondNumber = rand(1..20)
  end

  def evaluateQuestion(answer)
    rightAnswer = @firstNumber + @secondNumber
    if rightAnswer == answer.to_i
      true
    else
      false
    end
  end
end