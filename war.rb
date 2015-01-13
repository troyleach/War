=begin
	- ask user, 2 players or one player that plays against computer
	- each player gets 26 cards
	- both players display a card
	- the higher of the two cards wins and the winning player takes both cards and places them at the bottom of the their pile
	- the player with the highest card wins
		- if the two cards are equal there is a war!
			- each places 3 cards face down with the fourth facing up
			- the higher of the two takes all the cards
  - the player with all the cards wins
2
3
4
5
6
7
8
9
10
J
Q
K
A
CLUBS
SPADES
HEARTS
DIMONDS
each card is an object of the deck_of_cards
have an array of card objects

I CAN STORE THE SCORE IN MY PLAYER OBJECT, I HAVE ,@SCORE
=end

require_relative 'parse'
require_relative 'runner_utili'
require_relative 'player'
require_relative 'View'

class Game
  attr_reader :game, :players, :player1, :cards
  attr_accessor :num_of_players, :player1_hand, :player2_hand, :player1_show, :player2_show, :battle

  def initialize
    @game           = View.new
    @cards          = Deck.new
    @players        = []
    @player1_hand   = []
    @player2_hand   = []
    @battle         = []
    @num_of_players
    @player1
    @player1_show
    @player2_show
  end

  def run
    reset_screen!
    game.welcome
    get_number_of_players
    game.interduce_player(@player1)
    player_hands
    play_the_game
  end

  def player_hands
    cards.load_cards.each_with_index do |element, index|
      if index % 2 == 0
        player1_hand << element
      else
        player2_hand << element
      end
    end
  end

# get the number of players, in this first pass I only have one player but kept the method!
  def get_number_of_players
    until @num_of_players == 1
      print "How many players(at this time only enter one(1) please): "
      @num_of_players = gets.chomp.to_i
      if @num_of_players == 1
        set_names
      else
        puts "I don't understand that enter, please try again."
      end
    end
  end

#this is to get the player's name, again this is set up for several players
  def set_names
    until @players.length == @num_of_players
      print "Enter the name of the player: "
      @players << Player.new(gets.chomp.capitalize)
    end
      @players << Player.new("tBytes")
      @player1 = @players[0]
      @computer = @players[1]
  end

  def player_one_score
    player1_hand.shuffle!.unshift(battle).flatten!
  end

  def player_two_score
    player2_hand.shuffle!.unshift(battle).flatten!
  end

  def create_show_card
    battle.clear
    battle << player1_hand.shuffle!.slice!(-1, 1)
    battle << player2_hand.shuffle!.slice!(-1, 1)
  end

  def create_war_show_cards
    if player1_hand.size <= 3 || player2_hand.size <= 3
      lessthan
    else
      battle[0].concat(player1_hand.slice!(-4, 4)) 
      battle[1].concat(player2_hand.slice!(-4, 4))
    end
  end

  def lessthan
    if player1_hand.size <= 3 
      n = player1_hand.size
      battle[0].concat(player1_hand.slice!(-n, n))
      battle[1].concat(player2_hand.slice!(-n, n))
    else
      n = player2_hand.size
      battle[0].concat(player1_hand.slice!(-n, n))
      battle[1].concat(player2_hand.slice!(-n, n))
    end
  end

  def round
    line
    puts "Press return(enter) for next hand"
    puts "* " * 18
    #gets                                                   #uncomment this if you wish to play one at a time
    reset_screen!
    create_show_card
    game.show_cards(battle, @players)
    winner_of_battle
    game.show_scores(@players, player1_hand, player2_hand) #really should be only two arguments, not 3
  end

  def winner_of_battle
    if battle[0][-1].worth.to_i > battle[1][-1].worth.to_i
      puts
      puts "#{players[0].name} wins this battle"
      player_one_score
    elsif battle[1][-1].worth.to_i > battle[0][-1].worth.to_i
      puts
      puts "#{players[1].name} wins this battle"
      player_two_score
    else
      game.going_to_war(@players)
      war
    end
  end

  def war
    create_war_show_cards
    game.show_cards(battle, @players)
    winner_of_battle
  end

  def play_the_game
    until player1_hand.size == 0 || player2_hand.size == 0
      round
    end
    
    if player1_hand.size == 52
      game.winner(@players[0].name)
    else
      game.winner(@players[1].name)
    end
  end

end

Game.new.run


# - - - - - - BONE YARD - - - - - - - - 
#MAKE SURE I DO NOT SHUFFLE WHILE INSIDE THE GAME!!!!
# test = PlayersDeck.new
# test.player_hands
=begin

def war
    create_war_show_cards
    if player1_hand.size <= 3 || player2_hand <= 3
      #do this shit
    else
      game.show_cards(battle, @players)
      winner_of_battle
    end
  end

WHEN I HAD THIS IN MY CODE IT CREATED AN INFIDENT LOOP WHEN THERE WAS A TIE.. WHY?
SO I CREATED A METHOD THAT MADE THE WAR ARRAY
def war
    battle << player1_hand.slice!(-4, 4)
    battle << player2_hand.slice!(-4, 4)
    p battle[0].size
    game.show_cards_war(battle, @players)
    winner_of_battle
  end


    # @players.each do |player|
    #  @current_player = player.name
    # end

    # "returns this one #{player1_hand}"
    # player2_hand
    # # @@troy = ["troy"]

    # # player1_show = player1_hand.sample
    # # p "#{player1_show.rank} of #{player1_show.suit}"
    # # # p player2_hand

    battle = [["1", "2", "3", "4", "5", "6", "7"], ["A", "A1", "A2", "A3", "A4", "A5", "A6"]]
=end