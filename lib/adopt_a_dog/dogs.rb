class AdoptADog::Dogs
  attr_accessor :name, :breed, :location, :url, :story, :shelter

  @@all = []

  def initialize(name, breed, location, url)
    @name = name
    @breed = breed
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.limit_nine
    @@all.slice(0,9)
  end
end
