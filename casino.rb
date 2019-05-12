require "pry"
require "colorize"

require_relative 'Slots.rb'
require_relative 'roulette.rb'
require_relative 'User.rb'
require_relative 'Roshambo.rb'


class Casino 
  attr_accessor
  def initialize
    
    @wallet = 0
    @name = ""
    greet_c
    main_menu

  end 
  def greet_c
    print `clear`
    seperator
    puts "                       Welcome to POOR MAN'S CASINo".upcase.colorize(:red)
    x = Player.new(@wallet, @name)
    
    @name = x.greet_u
    @wallet = x.get_money
  end
  def main_menu
    print `clear`
    seperator
    puts "                       Welcome to the Casino #{@name.upcase.colorize(:red)} pick a game\n".blue
    puts "1) Roshambo".colorize(:blue)
    puts "2) Slots".colorize(:blue)
    puts "3) Roulette".colorize(:blue)
    puts "4) Check funds".colorize(:blue)
    puts "5) New Player".colorize(:blue)
    puts "6) Exit".colorize(:blue)
    seperator


    input = gets.strip.to_i
    case input 
    when 1
      x = Roshambo.new(@wallet, @name)
      @wallet = x.greet_r
      main_menu
    when 2
      x = Slots.new(@wallet, @name)
      @wallet = x.greet_s
      main_menu
    when 3
      x = Roulette.new(@wallet, @name)
      @wallet = x.greet_lette
      main_menu
    when 4
      print`clear`
      seperator
      
      puts "\n                                 #{@name}: $#{@wallet}".colorize(:green)
      seperator
      sleep 3
      main_menu
    when 5
      Casino.new
    when 6
      exit 
    else
      puts "invalid option"
      main_menu
    end 
  end
  def seperator
    puts "\n\n"
    puts "(*)".colorize(:yellow) *30
    puts "(*)".colorize(:red) *30
    puts "(*)".colorize(:yellow) *30
    puts "\n\n"
  end
end
Casino.new
