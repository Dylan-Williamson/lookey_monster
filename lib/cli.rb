class LookeyMonster::CLI
  def call
    introduction
    menu_loop
  end
#   def start
#     introduction
#     get_pokemon_data
#     game_loop
# end

# def get_pokemon_data
#     PokemonPandemic::APIManager.get_pokemon(@page, @limit)
# end



# def display_single_pokemon(i)
#     p = PokemonPandemic::Pokemon.all[i]
#     PokemonPandemic::APIManager.get_more_pokemon_info(p) if !p.full?
#     puts p.full_details
#     puts 'press any key to continue:'
#     getsf
# end

def menu_choice
    commands = ["list", "search", "exit"]
    input = gets.strip.downcase
    return input.downcase if commands.include?(input.downcase)
    if !valid?(input)
        puts "Wanna try that again?"
        return "invalid"
    end
    return input.to_i - 1
end

# def valid?(i)
#     i.to_i.between?(1, PokemonPandemic::Pokemon.all.length)
# end

# def menu
#     display_pokemon
#     display_instructions
# end

# def display_pokemon
#     start, stop = get_page_range
#     puts "\n\nPAGE #{@page}"
#     PokemonPandemic::Pokemon.all[start...stop].each.with_index(start) do |p, i|
#         puts "#{i+1}) #{p}"
#     end
# end



# def game_loop
#     loop do
#         menu
#         input = get_pokemon_choice
#         case input
#         when "exit"
#             break
#         when "invalid"
#             next
#         when "next"
#             @page += 1
#             _, stop = get_page_range
#             if PokemonPandemic::Pokemon.all.length < stop
#                 get_pokemon_data
#             end
#         when "prev"
#             if @page <= 1 
#                 puts "You cannot get that page, you are alredy on page 1!"
#             else
#                 @page -= 1
#             end
#         else
#             display_single_pokemon(input)
#         end
   
#     end
# end

# ---------------------------------------------------------------------------------

def menu_loop
    loop do
        menu
        input = menu_choice
        case input
        when "exit"
            break
        when "invalid"
            next
        when "list"
          list_loop
        when "search"
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
        print "[1-25]\n\n".cyan
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
          print "\n\nWhat's that?".light_red + "\n[yes] or [no]".cyan
          sleep(1)
        end
    end
end


def search_loop
    loop do
        print logo 
        print "-------".cyan
        print "Enter track and artist below".light_red
        print "------\n\n\n".cyan
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
          print "\nInvalid response. Wanna search for another song?\n".light_red + "[yes] or [no]\n".cyan
          input = gets.strip.downcase
        end
    end
end



  # def start
  #   menu
  #   input = gets.strip.downcase
  #   if input == "list"
  #     LookeyMonster::Scraper.top_scraper
  #     print "\n\n\n\n\n"
  #     print logo
  #     print_top_songs
  #     print "\nWhich song would you like more info on? ".light_red
  #     print "[1-25]\n\n".cyan
      
  #     input = gets.strip
      
  #     if (input != '0') && (input.to_i.to_s != input) or (input.to_i > LookeyMonster::Song.size)
  #       print "\nInvalid response. You will now exit automatically.\n\n".light_red
  #       exit
  #     else
  #       print_top_song(input.to_i - 1)
  #     end
      
  #     input = gets.strip.downcase
  #     if input == "y"
  #       logo
  #       start
  #     elsif input == "n"
  #       print goodbye
  #       exit
  #     else
  #       print "\nI'm sorry, could you try that again? Enter Yes[y] or No[n]\n\n".light_red
  #       start
  #     end
  #   elsif input == "search"
  #     print logo 
  #     print "-------".cyan
  #     print "Enter track and artist below".light_red
  #     print "------\n\n\n".cyan
  #     LookeyMonster::Scraper.scraper
  #     print_searched_song
  #   elsif input == "exit"
  #     exit
  #   else
  #     logo
  #     print "Care to try again? Enter [list] [search] or [exit]\n\n".light_red
  #     start
  #   end
  # end
  
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