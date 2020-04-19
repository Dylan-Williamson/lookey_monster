require 'pry'
require_relative './lookey_monster'
def scraper
  url = "https://tunebat.com/Search?q=hi"
  html = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(html)
  binding.pry 
end

scraper