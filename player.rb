class Player
  attr_reader :name, :lives

  def initialize name
    @name = name
    @lives = 3
  end

  def remove_life
    @lives -= 1 if @lives > 0
  end

  private 

  attr_writer :lives

end