class AdoptADog::Dogs
  attr_accessor :name, :sex, :location, :url

  def self.adoptable
    #should return instances of adoptable dogs
    puts "Logan Male Senior Baltimore"
    puts "Chase Male Adult Parkville"

    adoptable_ig = self.new
    adoptable_ig.name = "Logan"
    adoptable_ig.sex = "Male"
    adoptable_ig.location = "Baltimore"
    adoptable_ig.url = "url"
  end
end
