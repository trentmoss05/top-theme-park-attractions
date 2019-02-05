class TopThemeParkAttractions::CLI

  def call
    start
    more_info
    goodbye
  end

  def start
    puts "Which attractions would you like to see? (please enter 1-20, 21-40, 41-60, 61-80, or 81-100)"
    input = gets.strip.to_i

    show_attractions(input)

    puts "What attraction would you like more info on? (enter number)"
    input = gets.strip.to_i

  end

  def more_info

    input = nil
    while input != "exit"
      print "Enter the number of the attraction you want more info on or type list to see attraction list again: "
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on deal 1..."
      when "2"
        puts "More info on deal 2..."
      when "list"
        list_attractions
      else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Come back later to check attractions!"
  end

end
