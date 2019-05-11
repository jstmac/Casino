require "colorize"
require_relative 'Wallet'
require "pry"

class Wallet

  attr_accessor :amount
  
  def initialize(amount)
    @amount = amount
  end

end

class Player < Wallet
  attr_accessor :name, :age, :wallet

  def initialize
    puts "What is your name, player?".white
    @name = gets.strip
    puts "What is your age #{@name}?".white
    @age = gets.to_i
    if @age < 21
      puts "Sorry #{@name}, you need to be at least 21 to enter.".red
      exit
    end
    puts "How much money are you playing with #{@name}"
    amount = gets.to_i
    if amount < 1
      puts "Please enter a valid amount."
      Player.new
    end
    @wallet = Wallet.new(amount)
    binding.pry
  end
  
end

Player.new
# binding.pry

