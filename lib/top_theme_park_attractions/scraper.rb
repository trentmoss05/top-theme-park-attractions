require_relative '../top_theme_park_attractions'

class TopThemeParkAttractions::Scraper

  def get_doc
    Nokogiri::HTML(open("https://www.themeparktourist.com/tpt100"))
  end

  def scrape_attractions
    self.get_doc.css("tbody tr")
  end

  def make_attractions
    scrape_attractions.each do |n|
      TopThemeParkAttractions::Attractions.new_from_index_page(n)
    end
  end

end


TopThemeParkAttractions::Scraper.new.get_doc


#position of attraction = doc.css(".views-field-counter").text
# name of attraction = doc.css(".views-field-title a").text
# theme park for attraction = doc.css(".views-field-term-node-tid").text
# URL for attraction = doc.css(".views-field-title a").attribute("href").text
