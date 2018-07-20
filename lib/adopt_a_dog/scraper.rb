class AdoptADog::Scraper

  def self.scrape_dogs(results_url)
    html = open("https://www.petsmartcharities.org/find-a-pet-results?city_or_zip=21234&species=dog&color_id&geo_range=50&pet_size_range_id&sex&age=&breed_id=69")
    dogs = Nokogiri::HTML(html)
    dog_array =[]


    dogs.css(".pet-result").each do |dog|
      dog_array << {
        :name => dog.css(".pet-name").text,
        :breed => dog.css(".pet-breed").text,
        :sex => dog.css(".pet-sex").text,
        :location => dog.css(".pet-addr-city-state").text,
        :url => "https://www.petsmartcharities.org" + dog.css("a").attribute("href").value
      }
    end
    dog_array
  end

  def self.scrape_profile_page(url)
    # profile: profile.css(".pet-description").text
    # shelter name: profile.css(".pet-adoption-info").css(".shelter-name").text
    # website: profile.css(".pet-adoption-info").css(".website").text

    html = open(url)
    profile = Nokogiri::HTML(html)

    about_hash = {}

    about_hash[:story] = profile.css(".pet-description").text
    about_hash[:shelter] = profile.css(".pet-adoption-info").css(".shelter-name").text
    about_hash[:website] = profile.css(".pet-adoption-info").css(".website").text

    about_hash
  end

end
