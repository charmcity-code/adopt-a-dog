class AdoptADog::Scraper

  def self.scrape_dogs
    base_url = "https://www.petsmartcharities.org/find-a-pet-results?city_or_zip="
    zip_code = 21234
    last_url = "&species=dog&color_id&geo_range=50&pet_size_range_id&sex&age=&breed_id=69"
    full_url = base_url + zip_code.to_s + last_url

    html = open(full_url)
    doc = Nokogiri::HTML(html)

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

    dog.story = doc.css(".pet-description").text
    dog.shelter = doc.css(".pet-adoption-info").css(".shelter-name").text
    dog.website = doc.css(".pet-adoption-info").css(".website").text
  end

end
