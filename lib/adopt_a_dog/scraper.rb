class AdoptADog::Scraper

  BASE_URL = "https://www.petsmartcharities.org/find-a-pet-results?city_or_zip=21234&species=dog&color_id&geo_range=50&pet_size_range_id&sex&age=&breed_id=69"

  # BASE_PROFILE_URL = "https://www.petsmartcharities.org"

  def self.scrape_dogs
    html = open(BASE_URL)
    doc = Nokogiri::HTML(html)


    doc.css(".pet-result").each do |dog|


      name = dog.css(".pet-name").text
      breed = dog.css(".pet-breed").text
      sex = dog.css(".pet-sex").text
      location = dog.css(".pet-addr-city-state").text
      url = dog.css("a").attribute("href").value

      # binding.pry
      AdoptADog::Dogs.new(name, breed, sex, location, url)
    end

  end

  def self.scrape_profile_page(dog)
    # profile: profile.css(".pet-description").text
    # shelter name: profile.css(".pet-adoption-info").css(".shelter-name").text
    # website: profile.css(".pet-adoption-info").css(".website").text

    doc = Nokogiri::HTML(open("https://www.petsmartcharities.org#{dog.url}"))
    binding.pry
    dog.story = doc.css(".pet-description").text
    dog.shelter = doc.css(".pet-adoption-info").css(".shelter-name").text
    dog.website = doc.css(".pet-adoption-info").css(".website").text
    # binding.pry
  end

end
