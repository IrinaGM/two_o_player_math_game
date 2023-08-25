class Question
  attr_reader :number_1, :number_2

  def initialize 
    @number_1 = rand 1..20
    @number_2 = rand 1..20
  end

  def question_string
    "What does #{number_1} plus #{number_2} equal?"
  end
  
  def answered_correctly?(user_answer)
    number_1 + number_2 == user_answer
  end

end