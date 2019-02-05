class TopThemeParkAttractions::Attractions

  attr_accessor :name, :position, :url, :ride_type, :theme_park, :location, :park_url, :description, :opening_date

  @@all = []

  def self.new_from_index_page(doc)
    self.new(
      doc.css(".views-field-title a").text,
      doc.css(".views-field-title a").attribute("href").text,
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
    @ride_type ||= doc.css("div.attraction-info-box p").text
  end

  def location
  end

  def park_url
  end

  def description
  end

  def opening_date
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
