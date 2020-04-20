# require_relative './lookey_monster'

class LookeyMonster::CLI 
  
  
  def start
    menu
    
    user_input = nil
    
    while user_input != nil
    
      LookeyMonster::CLI.new.scraper
      
      print logo
      print "Track: #{:track}\nArtist: #{:artist}\nKey: #{:key}\nTempo: #{:tempo}\n\n"
      print options
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
  
  def options
    print "Would you like to search for another song? (YES or NO)"
  end
  def menu
    print logo
    print "    Please enter artist & song below:\n\n\n".light_red
    input = gets.chomp
  end
  
  def goodbye
    print "\n   Thank you for using LooKey Monster!\n\n\n".light_red
  end
  
  def top_hundred
    
  end
end

LookeyMonster::CLI







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
      
    else 
      puts "\nI'm sorry, could you try that again? Enter [list], [search] or [exit]"
    end
  end

  def print_top_song(song)
    print logo
    print "----------- #{song.name} by #{song.track} -----------\n".light_red
    print "Key: ".light_red + "#{song.key}".cyan
    print "Tempo: ".light_red + "#{song.tempo}".cyan
  end

  def print_top_songs(from_number)
    puts ""
    puts "---------- Restaurants #{from_number} - #{from_number+9} ----------"
    puts ""
    WorldsBestRestaurants::Restaurant.all[from_number-1, 10].each.with_index(from_number) do |restaurant, index|
      puts "#{index}. #{restaurant.name} - #{restaurant.location}"
    end
  end

end