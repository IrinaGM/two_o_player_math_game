class Player
  attr_accessor :lives

  def initialize
    @lives = 3
  end

  def loose_life
    @lives -= 1
  end

  def alive?
    @lives > 0
  end
end