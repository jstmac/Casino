class Slots
    def initialize (wallet_contents)
        @wallet_contents = wallet_contents 
        @a1 = ["Apple", "Lemon", "Bar"]
        @a2 = ["Apple", "Lemon", "Bar"]
        @a3 = ["Apple", "Lemon", "Bar"]
    end 
    def greet
        puts "Welcome to the slots, each spin $1"
        puts "Do you want to spin? (y/n)"
        input = gets.chomp 
     
        case input

            when "y"
                play_slots
         
            when "n"
        end   
         
    end 
        


    

    def play_slots 
        puts "Slot started"
        @s1 = @a1.sample 
        @s2 = @a2.sample
        @s3 = @a3.sample
        print @s1  
        print @s2
        print @s3
        outcome 
    end 
    def outcome
        if @s1 == @s2 && @s2 == @s3 
            puts "Win" 
        else  
            puts "Lose"
        end
        puts "game over"
        return @wallet_contents
    end 
    
end 

slots = Slots.new(50)
 slots.greet 
