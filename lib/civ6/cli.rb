# Our CLI Controller

class Civ6::CLI

  def call
    populate_data
    list_civilizations
    option
    goodbye
  end

  def populate_data
    # Scrape the website and populate the Civ6::Civ.all array
    Civ6::Civ.scrape_fandom
  end

  def list_civilizations
    puts "Civilizations of Civ 6:"
    @civ = Civ6::Civ.all
    @civ.each.with_index(1) do |civ, i|
      puts "#{i}. #{civ.name} - #{civ.leader} - #{civ.civ_ability}"
    end
  end

  def option
    input = nil
    while input != "exit"
      puts "Enter the number of civilization you want to learn more about or type list to see all the available civilizations or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0 and input.to_i < Civ6::Civ.all.length
        the_civ = @civ[input.to_i-1]
        puts "#{the_civ.name} - #{the_civ.leader} - #{the_civ.civ_ability}. For more information, check out #{the_civ.url} for more information."
      elsif input == "list"
        list_civilizations
      else
        puts "I'm not sure what you want - type list or exit!"
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more civilization wiki!"
  end

end
