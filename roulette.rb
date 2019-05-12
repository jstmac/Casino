### Roulette
require "colorize"


class Roulette
  def initialize(wallet,name)
    @player_wallet = wallet
    @valid_bets = [
      "Color",
      "Number",
      "Even",
      "Odd",
      "Low",
      "High"
    ]

    @colors = ["red","black", "green"]
    @bet_position = {color:"", range:[], payout: 0}
    @bet_types = ["color","range"]


    @name = name
  end

  def spin
    # 0 = 0, 37 = 00
    spin_result = {color:"", number:""}
    
    case @result = rand(0...37)
    when 0 || 37
      spin_result[:color] = "green"
      if @result == 37
        spin_result[:number] = "00"
      end
    else
      if @result % 2 == 0
        spin_result[:color] = "red"
      else
        spin_result[:color] = "black"
      end
      spin_result[:number] = "#{@result}"
    end
    return spin_result   
  end


  def place_bet
    system "clear"
    puts "You can bet on"
    @valid_bets.each_with_index do |b, i|
      puts "#{i+1}) #{b}"
    end

    print "Where would you like to place your bet? : "
    case gets.strip.to_i
    when 1
      puts "1) Red - Payout 1:1 Odds: 47.3%\n2) Black - Payout 1:1 Odds: 47.3%\n3) Green - Payout 1:1 Odds: 5.2%\n"
      print "What color? :"
      case gets.strip.to_i
      when 1
        @bet_position[:color] = "red"
        @bet_position[:payout] = 2
        return 1
      when 2
        @bet_position[:color] = "black"
        @bet_position[:payout] = 2
        return 1
      when 3
        @bet_position[:color] = "green"
        @bet_position[:payout] = 17
        return 1
      else
        puts "invalid selection"
      end

    when 2
      print "What number? (0, 00, 1-36): "

    when 3
    when 4
    when 5
    when 6
    else
    end
  end

  def get_wager
    system "clear"
    print "You have #{@player_wallet}, how much would you like to wager (or QUIT)?: "
    
    bet = gets.strip.to_i
    case 
    when bet.to_i > @player_wallet
      puts "I'm sorry [sir][madam] you dont seem to have enough to cover the bet."
      sleep(3)
      get_wager
    when bet.to_i <= @player_wallet  
      return bet
    when bet == ["quit", "0"]
      greet
    end
  end
  
  def start_game
    wager = get_wager
    bet_type = place_bet
    result = spin
    puts @bet_position
    puts result
    case bet_type
    when 1
      if result[:color] == @bet_position[:color]
        @player_wallet += wager * @bet_posistion[:payout]
        puts "you won"
      elsif
        @player_wallet -= wager
        puts "You lost $#{wager}, you have $#{@player_wallet} remaining." 
        sleep(3)
      end
    when 2
    end
  end

  def greet
    system "clear"
    puts "--- DPL Roulette ---"
    print "Good evening [sir][madam], would you like to place a bet? [y/N]: "
    if gets.strip.downcase == "y"
      start_game
    end
    print "Would you like to play again?"
    if gets.strip.downcase == "y"
      start_game
    end
    puts "Thanks for playing!"
    sleep(3)
    return @player_wallet
  end
end


roulette = Roulette.new(50, "bill")
roulette.greet





