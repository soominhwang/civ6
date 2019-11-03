class Civ6::Civ

  attr_accessor :name, :leader, :civ_ability, :domain_root, :url_part, :url

  @@all = []

  def initialize(name, leader, civ_ability, url)
    @name=name
    @leader=leader
    @civ_ability=civ_ability
    @url=url

    @@all << self
  end

  def self.all
    #Scrape fandom wiki and return civilizations based on that data
    @@all
  end

  def self.scrape_fandom
      doc = Nokogiri::HTML(open("https://civilization.fandom.com/wiki/Civilizations_(Civ6)"))
      dataset = doc.search("table.article-table").children
      domain_root = "https://civilization.fandom.com"
      header_index = 1

      dataset.each.with_index do |row, index|
        if (index != header_index and index % 2 != 0)
          if (row.children.length >= 5)
            name = row.children[2].children[0].children.text
            leader = row.children[3].children[2].children.text
            civ_ability = row.children[4].children[0].text
            url_part = row.children[1].children[0].first.last
            url = domain_root + url_part

            civ = self.new(name, leader, civ_ability, url)

          end
        end
      end
    end
  end

    #civ = self.new
    #civ

    #name, leader, civ_ability, url
    #Civ6::Civ.all << Civ6::Civ.new(name, leader, c_a, url)

    # civ.name = doc.search("table.article-table").children[3]
    # civ.name = doc.search("table.article-table").children[5]
    # civ.name = doc.search("table.article-table").children[7]

    #civ.name = doc.search("table.article-table").children[3].children[2].children[0].children.text
    #civ.leader = doc.search("table.article-table").children[3].children[3].children[2].children.text
    #civ.civ_ability = doc.search("table.article-table").children[3].children[4].children[0].text
    #civ.url_part = doc.search("table.article-table").children[3].children[1].children[0].first.last
    #civ.url = domain_root + civ.url_part

    # Go to fandom wiki, find the civ
    # Extract the properties
    # Instantiate a civ

    # our_data = doc.search("table.article-table").children
    # our_data is a table that contains all the data we want to show
    # our_data is in an array format --> every even number index is a newline character, so does not contain any valuable data

    # NAME OF CIVILIZATION
    # for instance, doc.search("table.article-table").children[3] contains all the information about the 'American' civilization
    # doc.search("table.article-table").children[3].children[2] contains the second column (civilization name) of the 'American' civilization
    # doc.search("table.article-table").children[3].children[2].children[0] contains even more granular info
    # doc.search("table.article-table").children[3].children[2].children[0].children contains even more granular info
    # doc.search("table.article-table").children[3].children[2].children[0].children.text gets us to the name of the 'American' civilization
    # using this logic, we can add +2 to the first children to get to all the other names of civilizations.
    # for instance, we can get 'Arabian' civilization (second on the alphabetical list) with the following code
    # doc.search("table.article-table").children[5].children[2].children[0].children.text gets us to the name of the 'American' civilization

    # NAME OF LEADER
    # doc.search("table.article-table").children[3].children[3].children[2].children.text

    # CIVILIZATION ABILITY
    # doc.search("table.article-table").children[3].children[4].children[0].text

    # URL for in depth information
    #

    #civ_1 = self.new
    #civ_1.name = "American"
    #civ_1.leader = "Teddy Roosevelt"
    #civ_1.civ_ability = "Founding Fathers"
    #civ_1.url = "https://civilization.fandom.com/wiki/American_(Civ6)"

    #civ_2 = self.new
    #civ_2.name = "Arabian"
    #civ_2.leader = "Saladin"
    #civ_2.civ_ability = "The Last Prophet"
    #civ_2.url = "https://civilization.fandom.com/wiki/Arabian_(Civ6)"

    #puts <<-DOC.gsub /^\s*/,''
    #American, Teddy Roosevelt, Founding Fathers
    #Arabian, Saladin, The Last Prophet
    #DOC
