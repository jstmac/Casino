require "colorize"

require "pry"

# class Wallet

#   attr_accessor :amount
  
#   def initialize(amount)
#     @amount = amount
#   end

# end

class Player 
  attr_accessor :name, :age, :wallet

  def initialize(wallet, name)
    @wallet = wallet
    @name = name
    @age = age
  end
  def greet_u


    puts "\n                        What is your name, player?".colorize(:blue)
    name = gets.strip


    seperator
    puts "\n                        What is your age #{@name.upcase.colorize(:red)}?".colorize(:blue)
    @age = gets.to_i
    seperator
    if @age < 21
      seperator
      puts "           Sorry #{@name}, you need to be at least 21 to enter.".red
      seperator
      exit
    end
    @name = name
  def get_money
    print`clear`
    seperator
      puts "                How much money are you playing with #{@name.upcase.colorize(:red)}".colorize(:blue)
      amount = gets.to_i
      seperator
      @wallet = amount
    end
    # if amount < 1
    #   puts "Please enter a valid amount."
    #   Player.new
    # end
    @age
    @name



  end
  def seperator
    puts "\n\n"
    puts "(*)".colorize(:yellow) *30
    puts "(*)".colorize(:red) *30
    puts "(*)".colorize(:yellow) *30
    puts "\n\n"
  end
  
end



