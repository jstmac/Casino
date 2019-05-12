### Roulette
require "colorize"


class Roulette
  def initialize(wallet,name)
    @player_wallet = wallet
    @name = name

    @valid_bets = [
    {position: "Red", odds: "1:2", payout: 2}, #red
    {position: "Black",odds: "1:2", payout: 2}, #black
    {position: "Green",odds: "1:18", payout: 17}, #green
    {position: "Number",odds: "1:38", payout: 37},
    {position: "1st Dozen",odds: "1:3.16", payout: 3},
    {position: "2nd Dozen",odds: "1:3.16", payout: 3},
    {position: "3rd Dozen",odds: "1:3.16", payout: 3}
    ]
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
      puts "#{i+1}) #{b[:position]} #{b[:odds]} #{b[:payout]}"
    end
    case gets.strip.to_i
    when 1
      return {color: "red", range:"", bet_table:1}
    when 2
      return {color: "black", range:"", bet_table:2}
    when 3
      return {color: "black", range:"", bet_table:3}
    when 4
      print "What number? (0, 00, 1-36): "
      selection = gets.strip
      if selection == "00" #handle double zero '00'
        return {color:"", range:37..37, bet_table:4}
      end
      return {color:"", range:selction.to_i..selection.to_i, bet_table:4}
    when 5
      return {color:"", range:1..12, bet_table:5}
    when 6
      return {color:"", range:13..24, bet_table:6}
    when 7
      return {color:"", range:25..36, bet_table:7}
    else
    end
  end

  def get_wager
    system "clear"
    print "You have #{@player_wallet}, how much would you like to wager (or QUIT)?: "
    
    bet = gets.strip.to_i
    case 
    when bet.to_i > @player_wallet
      puts "I'm sorry #{@name} you dont seem to have enough to cover the bet."
      sleep(3)
      get_wager
    when bet.to_i <= @player_wallet  
      return bet
    when bet == ["quit", "0"]
      greet
    end
  end
  
  def won(wager, bet)
    winnings = wager * @valid_bets[bet[:bet_table]][:payout]
    @player_wallet += winnings
    puts "You won #{winnings}!"
  end

  def lost(wager)
    @player_wallet -= wager
    puts "You lost $#{wager}, you have $#{@player_wallet} remaining." 
  end

  def start_game
    wager = get_wager #gets the monetary value of the bet
    bet = place_bet #lets the player select the color or position of his bet
    result = spin #gets the spin result
    puts bet
    puts result
    case bet[:bet_table]
    when 1,2,3
      if result[:color] == bet[:color]
        won(wager, bet)
      elsif
        lost(wager)
      end
    when 4,5,6,7
      if bet[:range] == result[:number]
        won(wager, bet)
      elsif
        lost(wager)
      end
    end
    print "Would you like to play again?"
    if gets.strip.downcase == "y"
      start_game
    end
    puts "Thanks for playing!"
    sleep(3)
  end

  def greet
    system "clear"
    puts "--- DPL Roulette ---"
    print "Good evening #{@name}, would you like to place a bet? [y/N]: "
    if gets.strip.downcase == "y"
      start_game
    end
    
    return @player_wallet
  end
end


# roulette = Roulette.new(50, "bill")
# roulette.greet





