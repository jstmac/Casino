require "pry"
require "colorize"


class Roshambo
   
    def initialize
        greet
    end

    def greet
        puts "Welcome to the craziness of Roshambo!"

        puts "Get Ready, Set, Choose Your Poison!"

        puts "1) Rock"
        puts "2) Paper"
        puts "3) Scissors"
        @input = gets.to_i

        puts "Nice choice...let's put it to the test"
        sleep(1.5)
        dealer
    end

    def dealer
        puts "Dealer says..."

        @dealer_choice = [1, 2, 3]

        dealer_roll
        case @dealer_roll
        when 1
            puts "Rock"
        when 2
            puts "Paper"
        when 3
            puts "Scissors"
        end
        
        sleep(1.5)

        result
    end  
end

def dealer_roll
     @dealer_roll = @dealer_choice[rand(@dealer_choice.length)]       
end

def result
     case true
     when @input == @dealer_roll
        puts "It's a tie!"

     when @input == 1 && @dealer_roll == 2
        puts "Paper covers rock...You Lose!"
     when @input == 1 && @dealer_roll == 3
        puts "Rock crushes scissors...You Win!"

    when @input == 2 && @dealer_roll == 1
        puts "Paper covers rock...You Win!"
    when @input == 2 && @dealer_roll == 3
        puts "Scissors cut paper...You Lose!"

    when @input == 3 && @dealer_roll == 1
        puts "Rock crushes scissors...You Lose!"
    when @input == 3 && @dealer_roll == 2
        puts "Scissors cut paper...You Win!"
    end


end

roshambo = Roshambo.new