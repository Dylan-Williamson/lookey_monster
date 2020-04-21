require_relative './lookey_monster'

class LookeyMonster::CLI

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts "Today's Daily Deals:"
    @deals = DailyDeal::Deal.today
    @deals.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the deal you'd like more info on or type list to see the deals again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_deal = @deals[input.to_i-1]
        puts "#{the_deal.name} - #{the_deal.price} - #{the_deal.availability}"
      elsif input == "list"
        list_deals
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!!!"
  end
end










# class LookeyMonster::CLI 
#   def call
#     LookeyMonster::Scraper.make_top_songs
#     logo
#     print "       WELCOME TO LOOKEY MONSTER!\n\n"
#     start
#   end
  
#   def start
#     menu
#     input = gets.chomp.downcase
#     if input == "list"
#       print "\n\n\n\n\n"
#       logo
#       print "Which song would you like to see? [1-100]\n\n"
#       print_top_songs
      
#       input = gets.strip.to_i

#       song = LookeyMonster::Song.find(input.to_i)

#       print_top_song(song)

#       print "\n\nWould you like to view another song? Yes[y] or No[n]\n\n"

#       input = gets.strip.downcase
#       if input == "y"
#         logo
#         start
#       elsif input == "n"
#         logo
#         print "Thank you for using LooKEY Monster!\n\n"
#         exit
#       else
#         print "\nI'm sorry, could you try that again? Enter Yes[y] or No[n]"
#         start
#       end
#     elsif input == "search"
#       LookeyMonster::Scraper.search_scraper
#       print_searched_song
#       binding.pry
#     elsif input == "exit"
#       exit
#     else
#       logo
#       print "Care to try again? Enter [list] [search] or [exit]\n\n"
#       start
#     end
#   end
  

#   def print_top_song(song)
#     logo
#     print "#{song.track} ".light_red
#     print "by".cyan
#     print " #{song.artist}\n".light_red
#     print "Key: ".light_red + "#{song.key}\n\n".cyan
#     print "Tempo: ".light_red + "#{song.tempo} BPM".cyan
#   end

#   def print_top_songs
#     print "\nLooKEY Monster's Top 100 List\n\n".light_red
#     LookeyMonster::Song.all.each_with_index do |song, index|
#       print "#{index + 1}.".cyan
#       print " #{song.track} ".light_red
#       print "by".cyan
#       print " #{song.artist}\n".light_red
#     end
#   end
  
#   def print_searched_song
#     LookeyMonster::Song.all.last
#   end
  
#   def menu
#     print "--------------".cyan
#     print "Top 100 List".light_red
#     print "--------------\n\n".cyan
#     print "              Enter [list]\n\n"
#     print "-------------".cyan
#     print "Custom Search".light_red
#     print "--------------\n\n".cyan
#     print "             Enter [search]\n\n"
#   end
  
  
  
#   def logo 
#     print "\n\n
#     ▄▄▌              ▄ •▄ ▄▄▄ . ▄· ▄▌    
#     ██•  ▪     ▪     █▌▄▌▪▀▄.▀·▐█▪██▌    
#     ██▪   ▄█▀▄  ▄█▀▄ ▐▀▀▄·▐▀▀▪▄▐█▌▐█▪    
#     ▐█▌▐▌▐█▌.▐▌▐█▌.▐▌▐█.█▌▐█▄▄▌ ▐█▀·.    
#     .▀▀▀  ▀█▄▀▪ ▀█▄▀▪·▀  ▀ ▀▀▀   ▀ •     
# • ▌ ▄ ·.        ▐ ▄ .▄▄ · ▄▄▄▄▄▄▄▄ .▄▄▄  
# ·██ ▐███▪▪     •█▌▐█▐█ ▀. •██  ▀▄.▀·▀▄ █·
# ▐█ ▌▐▌▐█· ▄█▀▄ ▐█▐▐▌▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐▀▀▄ 
# ██ ██▌▐█▌▐█▌.▐▌██▐█▌▐█▄▪▐█ ▐█▌·▐█▄▄▌▐█•█▌
# ▀▀  █▪▀▀▀ ▀█▄▀▪▀▀ █▪ ▀▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀\n\n\n".light_cyan
#   end
# end

# LookeyMonster::CLI

