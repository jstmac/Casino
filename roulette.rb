### Roulette
require "colorize"


class Roulette
  def initialize
  
  end

  def spin
    # 0 = 0, 37 = 00
    spin_result = {color:"", number:""}

    case result = rand(0...37)
    when result == 0 || result == 37
      spin_result[:color] = "Green".colorize(:green)
      if result == 37
        spin_result[:number] = "00"
      else
        spin_result[:number] = "#{result}"
      end
    else
      if result % 2 == 0
        spin_result[:color] = "Red".colorize(:red)
      else
        spin_result[:color] = "Black".colorize(:black)
      end
    end
    puts spin_result
    return spin_result   
  end

  def greet
    puts "hello" end

  def place_bet()

    #bet on 

    # case
    # when color # Green, Red or Black
    # when even # even or odd
    # when low # low (1-18) or high (19-36)
    # when number
    # end 


  end
end


roulette = Roulette.new
roulette.greet
#puts test.spin




