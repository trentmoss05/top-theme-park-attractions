class TopThemeParkAttractions::Attractions

  attr_accessor :name, :position, :url, :ride_type, :theme_park, :park_url, :description, :opening_date

  @@all = []

  def self.new_from_index_page(doc)
    self.new(
      doc.css(".views-field-title a").text,
      "https://www.themeparktourist.com#{doc.css(".views-field-title a").attribute("href").text}",
      doc.css(".views-field-term-node-tid").text,
      doc.css(".views-field-counter").text
      )
  end

  def initialize(name=nil, url=nil, theme_park=nil, position=nil)
    @name = name
    @url = url
    @theme_park = theme_park
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(number)
    self.all[number-1]
  end

  def ride_type
    @ride_type ||= doc.css("div.attraction-info-box p")[1].text.gsub(/([Type:])/, "")
  end

  def park_url
    @park_url ||= doc.css("div.field-items a").attribute("href").text
  end

  def description
    @description ||= doc.css("div.field-items p").text
  end

  def opening_date
    @opening_date ||= doc.css("div.attraction-info-box span.date-display-single").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
