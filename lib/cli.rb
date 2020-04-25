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
      print "\n\n\n\n\n" + logo
      s = LookeyMonster::Song.find(input.to_i)
      print_top_songs
      print "\nWhich song would you like more info on? ".light_red +"[1-100]\n\n".cyan
      
      input = gets.strip
      
      if (input != '0') && (input.to_i.to_s != input.strip)
        print "\nInvalid response. You will now exit automatically.\n".light_red
        exit
      else
        print_top_song(input.to_i - 1)
      end

      print "\n\nWould you like to view another song? ".light_red + "Yes[y] or No[n]\n\n".cyan

      input = gets.strip.downcase
      if input == "y"
        logo
        start
      elsif input == "n"
        logo
        print "Thank you for using LooKEY Monster!\n\n"
        exit
      else
        print "\nI'm sorry, could you try that again? Enter Yes[y] or No[n]\n".light_red
        start
      end
    elsif input == "search"
      print logo + "-------".cyan + "Enter track and artist below".light_red + "------\n\n\n".cyan
      LookeyMonster::Scraper.scraper
      print_searched_song
    elsif input == "exit"
      exit
    else
      logo
      print "Care to try again? Enter [list] [search] or [exit]\n\n".light_red
      start
    end
  end
  
  def print_searched_song
    print "\n\n\n\n\n\n" + logo + "Song: ".light_red +"#{LookeyMonster::Song.all.first.track} ".cyan + "by".light_red + " #{LookeyMonster::Song.all.first.artist}\n\n".cyan + "Key: ".light_red + "#{LookeyMonster::Song.all.first.key}\n\n".cyan + "Tempo: ".light_red + "#{LookeyMonster::Song.all.first.tempo}\n\n".cyan + "Want to search for another song? \n".light_red + "Yes[y] or No[n]?\n".cyan
    input = gets.chomp.downcase
    if input == "n"
      print goodbye
      exit
    elsif input == "y"
      print logo
      LookeyMonster::CLI.new.start 
    else
      print logo + "What was that? Please enter Yes[y] or No[n]\n\n".light_red + "Another invalid response will cause you to exit\n\n".cyan
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
    print "\n\n\n\n\n\n" + logo + "Song: ".light_red + "#{LookeyMonster::Song.all[s].track} ".cyan + "by".light_red + " #{LookeyMonster::Song.all[s].artist}\n\n".cyan + "Key: ".light_red + "#{LookeyMonster::Song.all[s].key}\n\n".cyan + "Tempo: ".light_red + "#{LookeyMonster::Song.all[s].tempo}\n\n".cyan + "Time Signature: ".light_red + "#{LookeyMonster::Song.all[s].time_signature}\n\n".cyan + "Acousticness: ".light_red + "#{LookeyMonster::Song.all[s].acousticness}\n\n".cyan + "Danceability: ".light_red + "#{LookeyMonster::Song.all[s].danceability}\n\n".cyan + "Energy: ".light_red + "#{LookeyMonster::Song.all[s].energy}\n\n".cyan + "Instrumentalness: ".light_red + "#{LookeyMonster::Song.all[s].instrumentalness}\n\n".cyan + "Liveness: ".light_red + "#{LookeyMonster::Song.all[s].liveness}\n\n".cyan + "Loudness: ".light_red + "#{LookeyMonster::Song.all[s].loudness}\n\n".cyan + "Speechiness: ".light_red + "#{LookeyMonster::Song.all[s].speechiness}\n\n".cyan
  end

  def print_top_songs
    print "\n------".cyan + "LooKEY Monster's Top 100 List".light_red + "------\n\n".cyan
    LookeyMonster::Song.all.each_with_index do |song, index|
      print "#{index + 1}.".cyan + " #{song.track} ".light_red + "by".cyan + " #{song.artist}\n".light_red
    end
  end
  
  def menu
    print "--------------".cyan + "Top 100 List".light_red + "--------------\n\n".cyan + "              Enter [list]\n\n" + "-------------".cyan + "Custom Search".light_red + "--------------\n\n".cyan + "             Enter [search]\n\n"
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
    print "\n\n\n\n\n\n\n" + logo + "Thank you for using LooKEY Monster!\n\n".light_red
  end
end

LookeyMonster::CLI



