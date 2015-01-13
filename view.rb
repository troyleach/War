# this will be in it's own file
class View
  def welcome
    line
    puts "WAR".center(center_it)
    line
    puts
    puts <<-STRING
    Welcome to WAR.. the fun and exciting card game!!
    First we need to find out if you are playing against
    the computer or a friend?
    STRING
    puts
    sleep(0.9)
  end

  def interduce_player(names)
    puts
    puts <<-STRING
    HI #{names.name}, you will be playing against the computer!
    The computer's name is tBytes
    Have fun...
    Lets get started
    STRING
    puts
    wait
  end

  #def interduce_multi_players(p1, p2)
  #end

  def show_cards(round, players)
    puts "#{players[0].name}'s card is a '#{round[0][-1].rank} of #{round[0][-1].suit}'"
    puts "and"
    puts "#{players[1].name}'s card is a '#{round[1][-1].rank} of #{round[1][-1].suit}'"
  end

  def going_to_war(players)
    puts "* " * 32
    puts <<-STRING
    #{players[0].name}, #{players[1].name} you are at WAR!!!!!
    Each player will now deal out 4 cards each with that last
    card showing... GOOD LUCK TO THE BOTH OF YOU!!!
    STRING
    puts "* " * 32
    wait
  end

  def show_scores(players, score1, score2) #really should be only two arguments, not 3
    puts
    puts "* " * 9
    puts "The score now is"
    puts "#{players[0].name} => #{score1.size}"
    puts "#{players[1].name} => #{score2.size}"
  end

  def winner(player)
    puts
    puts "* " * 19
    puts "* ! WINNER WINNER CHICKEN DINNER !  *"
    puts "* " * 19
    puts
    puts "#{player.upcase} YOU ARE THE WINNER!!"
    puts
  end
end