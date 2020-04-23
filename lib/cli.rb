require_relative './lookey_monster'
require_relative "../lib/scraper.rb"
require_relative "../lib/song.rb"
require 'nokogiri'
require 'colorize'

class LookeyMonster::CLI
  def call
    logo
    print "       WELCOME TO LOOKEY MONSTER!\n\n"
    start
  end
  
  def start
    menu
    input = gets.chomp.downcase
    if input == "list"
      LookeyMonster::Scraper.top_scraper
      print "\n\n\n\n\n"
      print logo
      s = LookeyMonster::Song.find(input.to_i)
      print_top_songs
      print "Which song would you like to see? [1-100]\n\n"
      
      input = gets.strip

      print_top_song(s)

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
      print logo
      print "-------".cyan
      print "Enter track and artist below".light_red
      print "------\n\n\n".cyan
      LookeyMonster::Scraper.scraper
      print_searched_song
    elsif input == "exit"
      exit
    else
      logo
      print "Care to try again? Enter [list] [search] or [exit]\n\n"
      start
    end
  end
  
  def print_searched_song
    print "\n\n\n\n\n\n"
    print logo
    print "Song: ".light_red
    print "#{LookeyMonster::Song.all.first.track} ".cyan
    print "by".light_red
    print " #{LookeyMonster::Song.all.first.artist}\n\n".cyan
    print "Key: ".light_red
    print "#{LookeyMonster::Song.all.first.key}\n\n".cyan
    print "Tempo: ".light_red
    print "#{LookeyMonster::Song.all.first.tempo}\n\n".cyan
    print "Url: ".light_red
    print "#{LookeyMonster::Song.all.first.url}\n\n\n".cyan
    print "Want to search for another song? \n".light_red
    print "Yes[y] or No[n]?\n".cyan
    input = gets.chomp.downcase
    if input == "n"
      print goodbye
      exit
    elsif input == "y"
      print logo
      LookeyMonster::CLI.new.start 
    else
      print logo
      print "What was that? Please enter Yes[y] or No[n]\n\n".light_red
      print "Another invalid response will cause you to exit\n\n".cyan
      input = gets.chomp.downcase
      if input == "n"
        print goodbye
        exit
      elsif input == "y"
      print logo
        LookeyMonster::CLI.new.start
      else
        print goodbye
        exit
      end
    end
  end

  def print_top_song(s)
    print "\n\n\n\n\n\n"
    logo
    print "#{s.track} ".light_red
    print "by".cyan
    print " #{s.artist}\n".light_red
    print "Key: ".light_red + "#{s.key}\n\n".cyan
    print "Tempo: ".light_red + "#{s.tempo} BPM".cyan
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

  def goodbye
    print "\n\n\n\n\n\n\n"
    print logo
    print "Thank you for using LooKEY Monster!\n\n".light_red
  end
end

LookeyMonster::CLI



