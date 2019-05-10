#require "pry"


#class User_Wallet
  attr_accessor :name, :wallet

  def initialize
    puts "What's your name?"
    name = gets.chomp
    sleep(1)
    @name = name
    @bankroll = 100.00
    puts "What is your quest?"
    sleep(1)
    quest = gets.chomp
    @quest = quest
  end

  def freshwallet
    @wallet = 100.00
  end
end


puts "hello"