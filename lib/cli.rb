require_relative './lookey_monster'

class LookeyMonster::CLI 
  
  
  def start
    menu
    get_song_info
  end
  
  def get_song_info
    LookeyMonster::Scraper.get_info("user_input")
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
  
  def menu
    print logo
    print "    Please enter artist & song below:\n\n\n".light_red
    input = gets.chomp
  end
  
  def goodbye
    print "\n   Thank you for using LooKey Monster!\n\n\n".light_red
  end
end

LookeyMonster::CLI
    # user_input = nil
    
    # while user_input != nil
    #   LookeyMonster::CLI.new.scraper
      
    #   print logo
    #   print "Track: #{:track}\nArtist: #{:artist}\nKey: #{:key}\nTempo: #{:tempo}\n\n"
    #   print goodbye
    # end