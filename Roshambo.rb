require "pry"
require "colorize"


class Roshambo
   
    def initialize(wallet, name)
        @wallet = wallet
        @name = name
        
    end

    def greet_r
        print `clear` 
        seperator
        puts "\n$5 to me if you lose and $10 to you if you win!\nYou've got $#{@wallet}\n".colorize(:blue)
        sleep 3
        puts "Get Ready #{@name.upcase}" 
        sleep 2
        puts "\nGet Set\n"
        sleep 2
        puts "\nChoose Your Poison!"

        puts "\n1) Rock".blue
        puts "2) Paper".red
        puts "3) Scissors".green
        @input = gets.to_i
        print `clear`
        seperator
        puts "\nNice choice...let's put it to the test".blue
        sleep(2)

        dealer
    end

    def dealer
        print `clear`
        seperator
        puts "\nDealer says...\n"
        sleep 2


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

    def dealer_roll
        @dealer_roll = @dealer_choice[rand(@dealer_choice.length)]       
    end

    def result
        case true
            when @input == @dealer_roll
            puts "\n\nIt's a tie!".yellow
            sleep 2
            
        when @input == 1 && @dealer_roll == 2
            puts "\nPaper covers rock...You Lose!".colorize(:red)
            @wallet -= 5
            sleep 2
        when @input == 1 && @dealer_roll == 3
            puts "\nRock crushes scissors...You Win!".colorize(:green)
            @wallet += 10
            sleep 2
            
        when @input == 2 && @dealer_roll == 1
            puts "\nPaper covers rock...You Win!".colorize(:green)
            @wallet += 10
            sleep 2
        when @input == 2 && @dealer_roll == 3
            puts "\nScissors cut paper...You Lose!".colorize(:red)
            @wallet -= 5
            sleep 2
            
        when @input == 3 && @dealer_roll == 1
            puts "\nRock crushes scissors...You Lose!".colorize(:red)
            @wallet -= 5
            sleep 2
        when @input == 3 && @dealer_roll == 2
            puts "\nScissors cut paper...You Win!".colorize(:green)
            @wallet += 10

            sleep 2
        end
        replay
    end

    def replay
        # print`clear`
        seperator
        puts "              You have $#{@wallet} left, feeling lucky #{@name.upcase}?!".green
        puts "1) Play again"
        puts "2) Exit"
        seperator
        choice = gets.to_i
        print `clear`
            case choice
            when 1
                greet_r
            when 2
                puts "Until next time...sayonara!"
                return @wallet
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

# roshambo = Roshambo.new