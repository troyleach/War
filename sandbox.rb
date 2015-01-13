


puts "* " * 19
puts "* ! WINNER WINNER CHICKEN DINNER !  *"
puts "* " * 19

class Card
  attr_accessor :rank, :suit, :deck

  def initialize(args = {})
    @rank = args[:rank]
    @suit = args[:suit]
  end
end



deck = []
cards = {:suit=>["clubs", "spades", "dimonds", "Hearts"], :rank=>["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]}
cards[:rank].each do |r|
  cards[:suit].each do |s|
    deck << "#{r} of #{s}" 
  end
  deck
end
p deck.size
p deck

# cards = { suit: 'Clubs', card_value: {"2" => 1, "3" => 2, "4" => 3, "5" => 4, "6" => 5, "7" => 6, "8" => 7, "9" => 8, "10" => 9, "J" => 10, "Q" => 11, "K" => 12, "A" => 13} }

# deck = []
# # p cards[:suit]
# # p cards[:card_value]

# cards[:card_value].each do |v|
#   deck << "#{v} of #{cards[:suit]} "
# end
# p deck[1]
# 
# WORKS JUST THE WAY I WOULD LIKE ~
=begin
suit = ['Clubs' 'Spades' 'Dimonds' 'Hearts']
what i really shoud do is this....(and I dont think this works)
cards = { suit: {'Clubs', 'Spades', 'Dimonds', 'Hearts'}, card_value: {"2" => 1, "3" => 2, "4" => 3, "5" => 4, "6" => 5, "7" => 6, "8" => 7, "9" => 8, "10" => 9, "J" => 10, "Q" => 11, "K" => 12, "A" => 13} }


card = { card_value: {"2" => 1, "3" => 2, "4" => 3, "5" => 4, "6" => 5, "7" => 6, "8" => 7, "9" => 8, "10" => 9, "J" => 10, "Q" => 11, "K" => 12, "A" => 13} }

deck = []
card.each_pair do |i, v|
  v.each do |e|
    deck << Card.new(i => e) 
  end
  deck
end

card_one = deck.sample

puts card_one.card_value[0]
{:card_value=>["2", 1]}
    p i => e

[#<Card:0x007fe02a981b58 @card_value=["5", 4]>, ..]
needs to look like
[#<Card:0x007fe02a981b58 @suit="Clubs", @card_value=["5", 4]>, ..]

=end








=begin
[{:card_value=>["2", 1]}]
[#<Card:0x007fe0b998db30 @suit="Spades", @card_value=["2"=>1]>]
PULLED THIS OFF THE INTERNET - NEED TO LOOK AT THIS TO TRY AND MAKE MINE MORE STREAMLINED
class Card
    VALUE = %w(2 3 4 5 6 7 8 9 10 J Q K A)

    attr_accessor :rank

    def initialize(id)
        self.rank = VALUE[id % 13]
    end
end

class Deck 
    attr_accessor :cards
    def initialize
        self.cards = (0..51).to_a.shuffle.collect { |id| Card.new(id) }
    end
end

class Array
    def shuffle!
        each_index do |i|
            r = rand(length-i) + i
            self[r], self[i] = self[i], self[r]
        end
    end

    def shuffle
        dup.shuffle!
    end
end


d = Deck.new
d.cards.each do |card|
    print "#{card.rank} "
end
  
=end