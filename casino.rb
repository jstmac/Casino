require "pry"
require "colorize"
# require_relative 'rock_paper_scissors.rb'
require_relative 'blackJack.rb'
require_relative 'roulette.rb'
require_relative 'User_Wallet.rb'
require_relative 'Roshambo.rb'

# class User
#   attr_accessor :name, :wallet
#   def initialize (name, wallet)
#     @name = name
#     @wallet = wallet
    
#   end 
# end
class Casino < Player
  attr_accessor
  def initialize
    # @user_wallet = UserWallet.new
    @wallet = 50
   main_menu
  end 
  def main_menu
    puts "1) pick one"
    input = gets.to_i
    case input
    when 1

      x =Roulette.new(@wallet)
      @wallet = x.greet
      
      goodbye

      puts "they taste great"
      sleep 2
    end
  end

end
Casino.new