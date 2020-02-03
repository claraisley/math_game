class Question

  attr_reader :n1, :n2

  def initialize()
    @n1 = rand(0..20)
    @n2 = rand(0..20)
  end

  def ask_question(player)
    puts "What does #{n1} plus #{n2} equal, #{player.name}?"
    print "> "
  end

  def correct(answ)
  return self.n1+self.n2 == answ
  end
end