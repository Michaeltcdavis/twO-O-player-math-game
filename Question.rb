class Question
  attr_reader :result

  def initialize
    @result = false
    ask_question
  end

  def generate_num
    rand(20) + 1
  end

  def ask_question
    x = generate_num
    y = generate_num
    answer = x + y
    puts "What is #{x} + #{y}"
    if answer.to_s() == gets.chomp
      puts "That's correct!" 
      return @result = true
    end
  end

  private 

  attr_writer :result

end

