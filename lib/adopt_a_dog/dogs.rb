class AdoptADog::Dogs
  attr_accessor :name, :sex, :location, :url

  def self.adoptable
    # should return instances of adoptable dogs
    # Scrape adopt-a-pet.com and return dogs based on that data
    self.scrape_dogs

  end

  def self.scrape_dogs
    # go to adopt-a-pet, find the adoptable dogs
    # extract the properties
    # instansiate a dog

    iggys = []

    doc = Nokogiri::HTML(open("https://www.adoptapet.com/dog-adoption/search/50/miles/21234?family_id=69"))
    binding.pry

    iggys
  end
end
