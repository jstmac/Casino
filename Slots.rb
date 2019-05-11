class Slots
    def initialize (wallet_contents)
        @wallet_contents = wallet_contents 
        @a1 = ["Apple", "Lemon", "Bar"]
        @a2 = ["Apple", "Lemon", "Bar"]
        @a3 = ["Apple", "Lemon", "Bar"]
    end 
    def greet_s
        @wallet_contents -= 1
        puts "Welcome to the slots, each spin $1"
        puts "Do you want to spin? (y/n)"
        input = gets.chomp 
        case input
            
        when "y"
            play_slots
            
        when "n"
        end   
        return @wallet_contents
         
    end 
        


    

    def play_slots 
        puts "Slot started"
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
            puts "Win" 
        else  
            sleep 1
            puts "\n"
            puts "Lose"
        end
        sleep 1
        puts "game over"
        return @wallet_contents
    end 
    
end 

# slots = Slots.new(50)
#  slots.greet 
