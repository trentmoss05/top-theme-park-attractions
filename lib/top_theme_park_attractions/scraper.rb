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
