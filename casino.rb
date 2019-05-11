require "pry"
require "colorize"

require_relative 'Slots.rb'
require_relative 'roulette.rb'
require_relative 'User.rb'
require_relative 'Roshambo.rb'


class Casino 
  attr_accessor
  def initialize
    
    @wallet = 50
    # main_menu
    greet_c
    main_menu

  end 
  def greet_c
    puts "Welcome to Henry's Whore house"
    x = Player.new(@wallet)
    @wallet = x.greet_u


    
  end
  def main_menu
    puts "Welcome to the Casino pick a game"
    puts "1) Roshambo"
    puts "2) Slots"
    puts "3) Roulette"
    puts "4) Check funds"
    puts "5) Exit"

# binding.pry
    input = gets.strip.to_i
    case input 
    when 1
      x = Roshambo.new(@wallet)
      @wallet = x.greet_r
      main_menu
    when 2
      x = Slots.new(@wallet)
      @wallet = x.greet_s
      main_menu
    when 3
      x = Roulette.new(@wallet)
      @wallet = x.greet_lette
      main_menu
    when 4
      puts "Wallet = $#{@wallet}"
      main_menu
    when 5
      exit 
    else
      puts "invalid option"
      main_menu
    end 
  end
end
Casino.new
# def main_menu
#   puts "1) pick one"
#   input = gets.to_i
#   case input
#   when 1
    
#     x =Roulette.new(@wallet)
#     @wallet = x.greet
    
#     goodbye
    
#     puts "they taste great"
#     sleep 2
#   end
# end