require_relative '../top_theme_park_attractions'

class TopThemeParkAttractions::Scraper

  def get_doc
    Nokogiri::HTML(open("https://www.themeparktourist.com/tpt100"))
  end

  def scrape_attractions
    self.get_doc.css(".views-field-title a")
  end



end


TopThemeParkAttractions::Scraper.new.get_doc



# name of attraction = doc.css(".views-field-title a").text
