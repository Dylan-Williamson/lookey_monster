class LookeyMonster::Scraper

  def self.top_scraper
    LookeyMonster::Song.reset_all
    
    url = "https://tunebat.com/Index/GetFeaturedTracks"
    hash = JSON.parse open(url).read
    LookeyMonster::Song.mass_create_from_api(hash["TrackItems"])
  end
  
  
  def self.scraper
    LookeyMonster::Song.reset_all
    
    input = gets.strip.downcase
    
    if input == "exit"
      print "\n\nThanks for using ".light_red + "LooKEY Monster\n\n".cyan
      exit
    elsif input.include?(" ") == true
      @url = "https://tunebat.com/Search?q=" + input.downcase.gsub!(" ","+")
    else 
      @url = "https://tunebat.com/Search?q=" + input.downcase
    end
    LookeyMonster::Scraper.get_page
    
    song_listings = @parsed_page.css('div.searchResultList.row.main-row')

    if song_listings.first.css('div.row.search-track-name').text == ""
      print "\nSorry, your search found 0 results. Please try again.\n\n".light_red
      LookeyMonster::Scraper.scraper
    else
      song_listings.first do |song_listing|
        song = {
          track: song_listing.css('div.row.search-track-name').text,
          artist: song_listing.css('div.row.search-artist-name').text,
          key: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[0],
          tempo: song_listing.css('div.row.search-attribute-value').text.scan(/\d+|\D+/)[3] + "BPM"
        }
      end
        LookeyMonster::Song.make_songs
    end
  end

  def self.get_page
    @parsed_page = Nokogiri::HTML(open(@url))
  end

  def self.scrape_songs
     self.get_page.css("div.searchResultNode.col-md-8.col-md-offset-2.col-sm-8.col-sm-offset-2.col-xs-12")
  end
  
  def self.make_songs
    LookeyMonster::Scraper.scrape_songs.each do |s|
      LookeyMonster::Song.new_from_index_page(s)
    end
  end
end