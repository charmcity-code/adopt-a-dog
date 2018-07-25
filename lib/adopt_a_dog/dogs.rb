class AdoptADog::Dogs
  attr_accessor :name, :breed, :sex, :location, :url, :story, :shelter, :website

  @@all = []

  def initialize(name, breed, sex, location, url)
    @name = name
    @breed = breed
    @sex = sex
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
end
