# require_relative './lookey_monster'

class LookeyMonster::CLI 

  def call
    LookeyMonster::Scraper.new.make_top_songs
    print logo
    print "Welcome to LooKEY Monster!"
    start
  end
  
  def start
    print "Would you like to see the top 100 list or do a custom search?".light_red
    print "Enter [list] or [search]".light_red
    input = gets.chomp.downcase
    if input == "list"
      print "\n\nWhich song would you like to see? [1-100]"
      
      input = gets.strip.to_i

      song = LookeyMonster::Song.find(input.to_i)

      print_top_song(song)

      print "\n\nWould you like to view another song? Yes[y] or No[n]"

      input = gets.strip.downcase
      if input == "y"
        start
      elsif input == "n"
        print logo
        print "Thank you for using LooKEY Monster!"
        exit
      else
        puts ""
        puts "I'm sorry, could you try that again? Enter Yes[y] or No[n]"
        start
      end
    elsif input == "search"
      print "no"
    else 
      puts "\nI'm sorry, could you try that again? Enter [list], [search] or [exit]"
    end
  end
  
  
  
  def logo 
    "\n\n
    ▄▄▌              ▄ •▄ ▄▄▄ . ▄· ▄▌    
    ██•  ▪     ▪     █▌▄▌▪▀▄.▀·▐█▪██▌    
    ██▪   ▄█▀▄  ▄█▀▄ ▐▀▀▄·▐▀▀▪▄▐█▌▐█▪    
    ▐█▌▐▌▐█▌.▐▌▐█▌.▐▌▐█.█▌▐█▄▄▌ ▐█▀·.    
    .▀▀▀  ▀█▄▀▪ ▀█▄▀▪·▀  ▀ ▀▀▀   ▀ •     
• ▌ ▄ ·.        ▐ ▄ .▄▄ · ▄▄▄▄▄▄▄▄ .▄▄▄  
·██ ▐███▪▪     •█▌▐█▐█ ▀. •██  ▀▄.▀·▀▄ █·
▐█ ▌▐▌▐█· ▄█▀▄ ▐█▐▐▌▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐▀▀▄ 
██ ██▌▐█▌▐█▌.▐▌██▐█▌▐█▄▪▐█ ▐█▌·▐█▄▄▌▐█•█▌
▀▀  █▪▀▀▀ ▀█▄▀▪▀▀ █▪ ▀▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀\n\n\n\n".light_cyan
  end
  
  # def options
  #   print "Would you like to search for another song? (YES or NO)"
  # end
  # def menu
  #   print logo
  #   print "    Please enter artist & song below:\n\n\n".light_red
  #   input = gets.chomp
  # end
  
  def print_top_song(song)
    print logo
    print "----------- #{song.name} by #{song.track} -----------\n".light_red
    print "Key: ".light_red + "#{song.key}".cyan
    print "Tempo: ".light_red + "#{song.tempo}".cyan
  end

  def print_top_songs
    print "\nLooKEY Monster's Top 100 List\n"
    LookeyMonster::Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.track} by #{song.artist}"
    end
  end
end

LookeyMonster::CLI

