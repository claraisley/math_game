class Player

  attr_accessor :lives
  attr_reader :name
  
  def initialize(name)
    @name = name
    @lives = 3
  end

  def life_count_down
    self.lives -= 1
  end

  def score
    return "#{self.lives} / 3"
  end
end