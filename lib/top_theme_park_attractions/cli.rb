class TopThemeParkAttractions::CLI

  def call
    TopThemeParkAttractions::Scraper.new.make_attractions
    puts "This is the top 100 Theme Park Attractions of the World!"
    start
  end

  def start
    puts "Which attractions would you like to see? (please enter 1-20, 21-40, 41-60, 61-80, or 81-100)"
    input = gets.strip.to_i

    show_attractions(input)

    puts "What attraction would you like more info on? (enter number)"
    input = gets.strip.to_i

    attraction = TopThemeParkAttractions::Attractions.find(input)

    more_info(attraction)

    puts "Would you like to see any more attractions? (please enter y or n)"

    input = gets.strip
    if input == "y"
      start
    elsif input == "n"
      goodbye
    else
      puts "Please try another answer."
      start
    end

  end

  def more_info(attraction)

  end

  def goodbye
    puts "Thank you!"
  end

  def show_attractions(numbers)
    puts "Attractions #{numbers} - #{numbers+19}"
    TopThemeParkAttractions::Attractions.all[numbers-1, 20].each.with_index(numbers) do |attraction, index|
      puts "#{index}. #{attraction.name} in #{attraction.theme_park}"
    end
  end

end
