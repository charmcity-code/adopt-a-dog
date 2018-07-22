class AdoptADog::Scraper

  def self.scrape_dogs
    doc = Nokogiri::HTML(open("https://www.petsmartcharities.org/find-a-pet-results?city_or_zip=Baltimore%2C%20MD&species=dog&color_id&geo_range=50&age=&breed_id=69&pet_size_range_id&sex"))

    doc.css(".pet-result").each do |dog|
      name = dog.css(".pet-name").text
      breed = dog.css(".pet-breed").text
      sex = dog.css(".pet-sex").text
      location = dog.css(".pet-addr-city-state").text
      url = dog.css("a").attribute("href").value

      AdoptADog::Dogs.new(name, breed, sex, location, url)
    end

  end

  def self.scrape_profile_page(dog)
    doc = Nokogiri::HTML(open("https://www.petsmartcharities.org#{dog.url}"))

    dog.story = doc.css(".pet-description").css("p").text
    dog.shelter = doc.css(".pet-adoption-info").css(".shelter-name").text
    dog.website = doc.css(".pet-adoption-info").css(".website").text
  end

end
