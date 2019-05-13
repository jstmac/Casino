### Roulette
require "colorize"
require"pry"

class Roulette
  def initialize(wallet,name)
    @player_wallet = wallet
    @name = name
    @valid_bets = [
    {position: "Red", odds: "1:2", payout: 2}, 
    {position: "Black",odds: "1:2", payout: 2}, 
    {position: "Green",odds: "1:18", payout: 17}, 
    {position: "Single Number",odds: "1:38", payout: 37},
    {position: "1-12",odds: "1:3.16", payout: 3},
    {position: "13-24",odds: "1:3.16", payout: 3},
    {position: "25-36",odds: "1:3.16", payout: 3}
    ]
  end

  def spin
    # 0 = 0, 37 = 00
    spin_result = {color:"", number:""}
    
    case @result = rand(0...37)
    when 0 || 37
      spin_result[:color] = "Green"
      if @result == 37
        spin_result[:number] = "00"
      end
    else
      if @result % 2 == 0
        spin_result[:color] = "Red"
      else
        spin_result[:color] = "Black"
      end
      spin_result[:number] = "#{@result}"
    end
    return spin_result   
  end

  def place_bet
    system "clear"
    puts "                  --- The Bet Table ---".colorize(:red)
    @valid_bets.each_with_index do |b, i|
      puts "#{i+1}) #{b[:position]}  - Odds: #{b[:odds]} - Payout: #{b[:payout]}x".colorize(:blue)
    end
    seperator
    print "            What would you like to bet on? : ".colorize(:blue)
    case gets.strip.to_i
    when 1
      return {color: "Red", range:"", bet_table:1}
    when 2
      return {color: "Black", range:"", bet_table:2}
    when 3
      return {color: "Green", range:"", bet_table:3}
    when 4
      print `clear`
      seperator
      print "What number? (0, 00, 1-36): ".colorize(:blue)
      seperator
      selection = gets.strip
      if selection == "00" #handle double zero '00'
        return {color:"", range:[37,37], bet_table:4}
      end
      return {color:"", range:[selection.to_i,selection.to_i], bet_table:4}
    when 5
      return {color:"", range:[1,12], bet_table:5}
    when 6
      return {color:"", range:[13,24], bet_table:6}
    when 7
      return {color:"", range:[25,36], bet_table:7}
    else
    end
  end

  def get_wager
    system "clear"
    print "You have #{@player_wallet}, how much would you like to wager (0 to quit)?: "
    bet = gets.strip.to_i
    puts bet
    case 
    when bet == 0
      greet_lette
    when bet > @player_wallet
      puts "I'm sorry #{@name} you dont seem to have enough to cover the bet."
      sleep(3)
      get_wager
    when bet <= @player_wallet  
      return bet
    end
  end
  
  def won(wager, bet)
    winnings = wager * @valid_bets[bet[:bet_table]][:payout]
    @player_wallet += winnings
    puts "                  You won $#{winnings}!".upcase.colorize(:blue)
  end

  def lost(wager)
    @player_wallet -= wager
    puts "                  You lost $#{wager}, you have $#{@player_wallet} remaining.".colorize(:red) 
    sleep 1
  end

  def start_game
    wager = get_wager #gets the monetary value of the bet
    bet = place_bet #lets the player select the color or position of his bet
    result = spin #gets the spin result
    #puts bet[:range]
    print `clear`
    seperator
    puts "                    Spinning the wheel...".colorize(:green)
    
    sleep(2)
    puts "                    The result is... #{result[:color]} #{result[:number]}".colorize(:blue)
    seperator
    puts "#{bet[:color]}"
    puts "#{bet[:bet_table]}"
    puts "#{result[:color]}"
    case bet[:bet_table]
    when 1..3 #a color based bet
      puts "color"
      if result[:color] === bet[:color]
        puts "hi"
        won(wager, bet)
      elsif
        lost(wager)
      end
    when 4,5,6,7 #a number based bet
      if result[:number].to_i.between?(bet[:range][0], bet[:range][1])
        won(wager, bet)
      elsif
        lost(wager)
      end
    end
    sleep 5
    print `clear`
    seperator
    sleep 1
    print "                   Would you like to play again?".colorize(:blue)
    if gets.strip.downcase == "y"
      start_game
    end
    print`clear`
    seperator
    puts "                        Thanks for playing!".colorize(:blue)
    seperator
    sleep(2)
  end
  def seperator
    puts "\n\n"
    puts "(*)".colorize(:yellow) *30
    puts "(*)".colorize(:red) *30
    puts "(*)".colorize(:yellow) *30
    puts "\n\n"
  end
  def greet_lette
    system "clear"
    seperator
    puts "                 ------------------- DPL Roulette ---------------------\n".colorize(:red)
    print "                Good evening #{@name}, would you like to place a bet? [y/n]: ".colorize(:blue)
    seperator
    if gets.strip.downcase == "y"
      start_game
    end
    
    return @player_wallet
  end
  
end


 roulette = Roulette.new(50, "bill")
 roulette.greet_lette
