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
    print "\n\nWhich song would you like to see? [1-100]"
    input = gets.strip.to_i

    song = LookeyMonster::Song.find(input.to_i)

    print_restaurant(restaurant)

    puts ""
    puts "Would you like to see another restaurant? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_restaurant(restaurant)
    puts ""
    puts "----------- #{restaurant.name} - #{restaurant.position} -----------"
    puts ""
    puts "#{restaurant.intro_quote}"
    puts "Location:           #{restaurant.location}"
    puts "Head Chef:          #{restaurant.head_chef}"
    puts "Contact:            #{restaurant.contact}"
    puts "Phone:             #{restaurant.phone}"
    puts "Website:            #{restaurant.website_url}"

    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{restaurant.description}"
    puts ""

    puts ""
    puts "---------------About the Food--------------"
    puts ""
    puts "#{restaurant.food_style}"
    puts ""
  end

  def print_restaurants(from_number)
    puts ""
    puts "---------- Restaurants #{from_number} - #{from_number+9} ----------"
    puts ""
    WorldsBestRestaurants::Restaurant.all[from_number-1, 10].each.with_index(from_number) do |restaurant, index|
      puts "#{index}. #{restaurant.name} - #{restaurant.location}"
    end
  end

end