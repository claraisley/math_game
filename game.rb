require "./player"
require "./question"

class Game
  attr_accessor :p1, :p2, :current_p, :game_over

  def initialize(p1_name, p2_name)
    @p1 = Player.new(p1_name)
    @p2 = Player.new(p2_name)

    @current_p = p1
    @game_over = false
  end

  def start_game
    while !self.game_over
      question = Question.new
      question.ask_question(current_p)
      answ = $stdin.gets.chomp.to_i

      if(!question.correct(answ))
        current_p == p1 ? p1.life_count_down : p2.life_count_down
        
        if p1.lives == 0 || p2.lives == 0
          self.game_over = true
        end
        message(false)
      else
      message(true)
      end
    end
  end

  def message(is_correct)
    puts is_correct ? "#{current_p.name}, you are correct!" : "#{current_p.name}, nope, try again next time."
    puts "Score: #{p1.name}: #{p1.score} / #{p2.name}: #{p2.score}"

    if (game_over)
      puts current_p.name == p1.name ? "#{p2.name} wins! Sorry #{p1.name}." : "#{p1.name} wins! Sorry #{p2.name}."
      puts "------GAME OVER------"
      puts "Bye!"
      exit(0)
    
    else 
      puts "------NEW TURN------"
      next_turn
    end
  end

  def next_turn
    if (current_p.name == p1.name)
      self.current_p = p2
    else 
      self.current_p = p1
    end
  end
end