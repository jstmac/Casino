class Slots
    def initialize (wallet_contents, name)
        @wallet_contents = wallet_contents 
        @a1 = ["Apple", "Lemon", "Bar"]
        @a2 = ["Apple", "Lemon", "Bar"]
        @a3 = ["Apple", "Lemon", "Bar"]
        @name = name
    end 
    def greet_s
        print `clear`
        seperator
        puts "\n                Welcome to the slots, each spin $1".colorize(:blue)
        puts "                  Do you want to spin? (y/n)\n\n".colorize(:blue)
        seperator
        input = gets.chomp 
        case input
            
        when "y"
            play_slots
            @wallet_contents -= 1
            
        when "n"
        end   
        return @wallet_contents
         
    end 
        


    

    def play_slots
        print`clear`
        seperator
        puts "\n                       Slot started".upcase.colorize(:blue)
        @s1 = @a1.sample 
        @s2 = @a2.sample
        @s3 = @a3.sample
        puts "\n"
        sleep 1
        puts "                         #{@s1}\n "
        puts "\n"
        sleep 1  
        puts "                         #{@s2}\n "
        puts "\n"
        sleep 1  
        puts "                         #{@s3}\n "
        puts "\n"
        sleep 1  
        outcome 
        sleep 1
    end 
    def outcome
        if @s1 == @s2 && @s2 == @s3 
            seperator
            puts " \n                   Win!!!!!!!\n".upcase.colorize(:blue)
            @wallet_contents += 500
        else  
            sleep 1
            
            seperator
            puts "\n"
            puts "                       Lose\n".upcase.colorize(:yellow)
            @wallet_contents -= 5
        end
        sleep 1

        puts "\n                         game over".upcase.colorize(:red)
        sleep 2
        seperator
        replay
    end 
    def seperator
        puts "\n\n"
        puts "(*)".colorize(:yellow) *30
        puts "(*)".colorize(:red) *30
        puts "(*)".colorize(:yellow) *30
        puts "\n\n"
      end
      def replay
        # print`clear`
        seperator
        puts "              You have $#{@wallet_contents} left, feeling lucky #{@name.upcase}?!\n\n".green
        puts "1) Play again"
        puts "2) Exit"
        seperator
        choice = gets.to_i
        print `clear`
            case choice
            when 1
                play_slots
            when 2
                seperator
                puts "\n                    Until next time...sayonara!".green
                return @wallet_contents
            end
    end
    
end 

# slots = Slots.new(50)
#  slots.greet 
