class LookeyMonster::CLI
  def call
    introduction
    menu_loop
  end

  def menu_choice
    commands = ["list", "search", "exit"]
    input = gets.strip.downcase
    return input.downcase if commands.include?(input.downcase)
    if commands.include?(input) == false
        puts "\nWanna try that again?\n".light_red
        return "invalid"
    end
    return input.to_i - 1
  end

  def menu_loop
      loop do
          menu
          input = menu_choice
          case input
          when "exit"
            print "Thanks for using ".light_red + "LooKEY Monster".cyan
              break
          when "invalid"
              next
          when "list"
            list_loop
          when "search"
              print logo 
              search_loop
          else
              print_top_song(input.to_i - 1)
          end
      end
  end

  def list_loop
      loop do
          LookeyMonster::Scraper.top_scraper
          print "\n\n\n\n\n"
          print logo
          print_top_songs
          print "\nWhich song would you like more info on? ".light_red
          print "[1-25]\n".cyan
          print "Or enter ".light_red + "[exit]".cyan + " to exit the program\n\n".light_red
          input = gets.strip.downcase  
          if input == "exit"
            print "\n\nThanks for using ".light_red + "LooKEY Monster!\n\n".cyan
            exit
          elsif (input != '0') && (input.to_i.to_s != input) or (input.to_i > LookeyMonster::Song.size)
            print "\nInvalid response. Try again".light_red
            sleep(1)
            next
          else
            print_top_song(input.to_i - 1)
          end
          input = gets.strip.downcase
          case input
          when "yes"
            redo
          when "no"
            print "\n\nThanks for using ".light_red + "LooKEY Monster!\n\n".cyan
            exit
          else
            print "\n\nLet's try that again".light_red
            sleep(1)
          end
      end
  end


  def search_loop
      loop do
          print "\n\n\n-------".cyan
          print "Enter track and artist below".light_red
          print "------\n".cyan
          print "--(".light_red + "Or enter ".cyan + "[exit]".light_red + " to exit the program".cyan + ")--\n\n".light_red
          LookeyMonster::Scraper.scraper
          print_searched_song
          input = gets.strip
          case input
          when "yes"
            redo
          when "no"
            print "\n\n\n\n\nThanks for using ".light_red + "LooKEY Monster!\n\n".cyan
            exit
          else
            print "\n            INVALID RESPONSE\n".cyan
            next
          end
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
    print "Tempo: ".light_red + "#{LookeyMonster::Song.all.first.tempo}\n\n".cyan
    print "Wanna search for another song?".light_red + "\n[yes] or [no]\n".cyan
  end
  
  def print_top_song(s)
    print "\n\n\n\n\n\n"
    print logo
    print "Song: ".light_red
    print "#{LookeyMonster::Song.all[s].track} ".cyan
    print "by".light_red
    print " #{LookeyMonster::Song.all[s].artist}\n\n".cyan
    print "Key: ".light_red
    print "#{LookeyMonster::Song.all[s].key}\n\n".cyan
    print "Tempo: ".light_red
    print "#{LookeyMonster::Song.all[s].tempo}\n\n".cyan
    print "Time Signature: ".light_red
    print "#{LookeyMonster::Song.all[s].time_signature}\n\n".cyan
    print "Acousticness: ".light_red
    print "#{LookeyMonster::Song.all[s].acousticness}\n\n".cyan
    print "Danceability: ".light_red
    print "#{LookeyMonster::Song.all[s].danceability}\n\n".cyan
    print "Energy: ".light_red
    print "#{LookeyMonster::Song.all[s].energy}\n\n".cyan
    print "Instrumentalness: ".light_red
    print "#{LookeyMonster::Song.all[s].instrumentalness}\n\n".cyan
    print "Liveness: ".light_red
    print "#{LookeyMonster::Song.all[s].liveness}\n\n".cyan
    print "Loudness: ".light_red
    print "#{LookeyMonster::Song.all[s].loudness}\n\n".cyan
    print "Speechiness: ".light_red
    print "#{LookeyMonster::Song.all[s].speechiness}\n\n".cyan
    print "\n\nWould you like to view another song?\n".light_red
    print "[yes] or [no]\n\n".cyan
  end
  
  def print_top_songs
    print "------".cyan
    print "LooKEY Monster's Top 25 List".light_red
    print "------\n\n".cyan
    LookeyMonster::Song.all.each_with_index do |song, index|
      print "#{index + 1}.".cyan
      print " #{song.track} ".light_red
      print "by".cyan
      print " #{song.artist}\n".light_red
    end
  end
  
  def menu
    print "--------------".cyan
    print "Top 25 List".light_red
    print "--------------\n\n".cyan
    print "              Enter [list]\n\n"
    print "-------------".cyan
    print "Custom Search".light_red
    print "--------------\n\n".cyan
    print "             Enter [search]\n\n"
  end
  
  def introduction
    print "       WELCOME TO LOOKEY MONSTER!\n\n".light_red
    print logo
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
▀▀  █▪▀▀▀ ▀█▄▀▪▀▀ █▪ ▀▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀\n\n\n".cyan
  end

  def goodbye
    print "\n\n\n\n\n\n\n"
    print logo
    print "Thank you for using LooKEY Monster!\n\n".light_red
  end
end

LookeyMonster::CLI