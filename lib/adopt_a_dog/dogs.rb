class AdoptADog::Dogs
  attr_accessor :name, :sex, :location, :url

  def self.adoptable
    #should return instances of adoptable dogs
    # puts "Logan Male Senior Baltimore"
    # puts "Chase Male Adult Parkville"
    iggys = []

    adoptable_ig = self.new
    adoptable_ig.name = "Logan"
    adoptable_ig.sex = "Male"
    adoptable_ig.location = "Baltimore"
    adoptable_ig.url = "logan.com"
    iggys << adoptable_ig

    adoptable_ig2 = self.new
    adoptable_ig2.name = "Chase"
    adoptable_ig2.sex = "Male"
    adoptable_ig2.location = "Parkville"
    adoptable_ig2.url = "chase.com"
    iggys << adoptable_ig2
    
    iggys
  end
end
