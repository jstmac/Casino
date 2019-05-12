class Slots
    def initialize (wallet_contents)
        @wallet_contents = wallet_contents 
        @a1 = ["Apple", "Lemon", "Bar"]
        @a2 = ["Apple", "Lemon", "Bar"]
        @a3 = ["Apple", "Lemon", "Bar"]
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
        print `clear` 
        seperator
        puts "\n               Slot started".upcase.colorize(:blue)
        @s1 = @a1.sample 
        @s2 = @a2.sample
        @s3 = @a3.sample
        puts "\n"
        sleep 1
        print @s1
        puts "\n"
        sleep 1  
        print @s2
        puts "\n"
        sleep 1  
        print @s3
        puts "\n"
        sleep 1  
        outcome 
        sleep 1
    end 
    def outcome
        if @s1 == @s2 && @s2 == @s3 
            seperator
            puts " \n               Win!!!!!!!\n".upcase.colorize(:blue)

        else  
            sleep 1
            
            seperator
            puts "\n"
            puts "              Lose\n".upcase.colorize(:yellow)

        end
        sleep 1

        puts "\n                game over".upcase.colorize(:red)
        seperator
        return @wallet_contents
    end 
    def seperator
        puts "\n\n"
        puts "(*)".colorize(:yellow) *40
        puts "\n\n"
      end
    
end 

# slots = Slots.new(50)
#  slots.greet 
