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
    puts "What is your name, player?"
    name = gets.strip
    puts "What is your age #{name.upcase.red}?"
    @age = gets.to_i
    if @age < 21
      puts "Sorry #{@name}, you need to be at least 21 to enter.".red
      exit
    end
    @name = name
    def get_money
      puts "How much money are you playing with #{@name.upcase.colorize(:red)}"
      amount = gets.to_i
      @wallet = amount
    end
    # if amount < 1
    #   puts "Please enter a valid amount."
    #   Player.new
    # end
    @age
    @name



  end
  
end



