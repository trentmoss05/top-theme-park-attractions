class TopThemeParkAttractions::CLI

  def call
    TopThemeParkAttractions::Scraper.new.make_attractions
    puts "This is the top 100 Theme Park Attractions of the World!"
    puts ""
    start
  end

  def start
    puts "Which attractions would you like to see? (enter a number 1-100)"
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
    puts ""
    puts "#{attraction.name} in #{attraction.theme_park.strip}"
    puts ""
    puts "Type of Attraction:         #{attraction.ride_type.strip}"
    puts ""
    puts "Park URL:                   #{attraction.park_url}"
    puts ""
    puts "Attraction Opening Date:    #{attraction.opening_date}"
    puts ""
    puts "Description of Attraction: #{attraction.description}"
    puts ""
  end

  def goodbye
    puts "Thank you!"
  end

  def show_attractions(numbers)
    puts ""
    puts "Attractions #{numbers} - #{numbers+14}"
    puts ""
    TopThemeParkAttractions::Attractions.all[numbers-1, 15].each.with_index(numbers) do |attraction, index|
      puts "#{index}. #{attraction.name} in #{attraction.theme_park.strip}"
      puts ""
    end
  end

end
