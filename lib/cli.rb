require_relative './lookey_monster'
require_relative "../lib/scraper.rb"
require_relative "../lib/song.rb"
require 'nokogiri'
require 'colorize'

class LookeyMonster::CLI 
  def call
    LookeyMonster::Scraper.make_top_songs
    logo
    print "       WELCOME TO LOOKEY MONSTER!\n\n"
    start
  end
  
  def start
    menu
    input = gets.chomp.downcase
    if input == "list"
      print "\n\n\n\n\n"
      logo
      print "Which song would you like to see? [1-100]\n\n"
      print_top_songs
      
      input = gets.strip.to_i

      song = LookeyMonster::Song.find(input.to_i)

      print_top_song(song)

      print "\n\nWould you like to view another song? Yes[y] or No[n]\n\n"

      input = gets.strip.downcase
      if input == "y"
        logo
        start
      elsif input == "n"
        logo
        print "Thank you for using LooKEY Monster!\n\n"
        exit
      else
        print "\nI'm sorry, could you try that again? Enter Yes[y] or No[n]"
        start
      end
    elsif input == "search"
      LookeyMonster::Scraper.search_scraper
      print_searched_song
      binding.pry
    elsif input == "exit"
      exit
    else
      logo
      print "Care to try again? Enter [list] [search] or [exit]\n\n"
      start
    end
  end
  

  def print_top_song(song)
    logo
    print "#{song.track} ".light_red
    print "by".cyan
    print " #{song.artist}\n".light_red
    print "Key: ".light_red + "#{song.key}\n\n".cyan
    print "Tempo: ".light_red + "#{song.tempo} BPM".cyan
  end

  def print_top_songs
    print "\nLooKEY Monster's Top 100 List\n\n".light_red
    LookeyMonster::Song.all.each_with_index do |song, index|
      print "#{index + 1}.".cyan
      print " #{song.track} ".light_red
      print "by".cyan
      print " #{song.artist}\n".light_red
    end
  end
  
  def print_searched_song
    LookeyMonster::Song.all.last
  end
  
  def menu
    print "--------------".cyan
    print "Top 100 List".light_red
    print "--------------\n\n".cyan
    print "              Enter [list]\n\n"
    print "-------------".cyan
    print "Custom Search".light_red
    print "--------------\n\n".cyan
    print "             Enter [search]\n\n"
  end
  
  
  
  def logo 
    print "\n\n
    ▄▄▌              ▄ •▄ ▄▄▄ . ▄· ▄▌    
    ██•  ▪     ▪     █▌▄▌▪▀▄.▀·▐█▪██▌    
    ██▪   ▄█▀▄  ▄█▀▄ ▐▀▀▄·▐▀▀▪▄▐█▌▐█▪    
    ▐█▌▐▌▐█▌.▐▌▐█▌.▐▌▐█.█▌▐█▄▄▌ ▐█▀·.    
    .▀▀▀  ▀█▄▀▪ ▀█▄▀▪·▀  ▀ ▀▀▀   ▀ •     
• ▌ ▄ ·.        ▐ ▄ .▄▄ · ▄▄▄▄▄▄▄▄ .▄▄▄  
·██ ▐███▪▪     •█▌▐█▐█ ▀. •██  ▀▄.▀·▀▄ █·
▐█ ▌▐▌▐█· ▄█▀▄ ▐█▐▐▌▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐▀▀▄ 
██ ██▌▐█▌▐█▌.▐▌██▐█▌▐█▄▪▐█ ▐█▌·▐█▄▄▌▐█•█▌
▀▀  █▪▀▀▀ ▀█▄▀▪▀▀ █▪ ▀▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀\n\n\n".light_cyan
  end
end

LookeyMonster::CLI









# class LookeyMonster::CLI
  
#   BASE_PATH = "https://tunebat.com/"

#   def self.run
#     make_top_songs
#     add_song_attributes
#     display_top_songs
#   end

#   def self.make_top_songs
#     songs_array = LookeyMonster::Scraper.scrape_index_page(BASE_PATH)
#     LookeyMonster::Song.create_from_collection(songs_array)
#   end

#   def self.add_song_attributes
#     LookeyMonster::Song.all.each do |song|
#       attributes = Scraper.scrape_profile_page(BASE_PATH + song.song_info_url)
#       student.add_student_attributes(attributes)
#     end
#   end

#   def self.display_top_songs
#     LookeyMonster::Song.all.each do |song|
#       puts "#{song.track.upcase}".colorize(:blue)
#       puts " #{song.artist}".colorize(:blue)
#       puts "----------------------".colorize(:green)
#     end
#   end
# binding.pry
# end