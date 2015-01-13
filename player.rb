# This will be in it's own file
class Player
  attr_reader   :name
  attr_accessor :score

  def initialize(name)
    @name   = name
    @score  = 0
  end
end