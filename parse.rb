require 'csv'

# Card could go into it's own file
class Card
  attr_accessor :suit, :rank, :worth

  def initialize(args = {})
    @rank = args[:suit]
    @suit = args[:rank]
    @worth  = args[:worth]
  end
end

class Deck
  attr_accessor :deck_of_cards

  def initialize
    @deck_of_cards = []
  end

  def load_cards
    CSV.foreach("cards.csv", :headers => true, :header_converters => :symbol) do |row|
      @deck_of_cards << Card.new(row)
    end
     @deck_of_cards.shuffle!
  end
end
