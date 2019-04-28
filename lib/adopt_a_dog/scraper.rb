require 'pry'
class AdoptADog::Scraper
  def self.scrape_dogs(zip_code)
    base_url = "https://petsmartcharities.org/adopt-a-pet/find-a-pet?city_or_zip="
    zip_code = zip_code
    last_url = "&species=dog&cats_or_dogs=dog&other_pets=_none&age=&breed_id=real%3D69&color_id=&geo_range=&pet_size_range_id=&sex=&form_build_id=form-N8TtLicxFeDUiDMlagqRb8D_b7D-TwG6wa6JHIX0eCI&form_id=adopt_a_pet_search_form"
    full_url = base_url + zip_code + last_url

    html = open(full_url)
    doc = Nokogiri::HTML(html)
    dogs = doc.css(".adopt-a-pet-grid")

    dogs.css(".adopt-a-pet-item").each do |dog|
      name = dog.css("h4").text
      breed = dog.css("h6").text
      location = dog.css(".aap-location").text
      url = dog.css(".find-a-pet-link").css("a").attribute("href").value

      AdoptADog::Dogs.new(name, breed, location, url)
    end
  end

  def self.scrape_profile_page(dog)
    doc = Nokogiri::HTML(open("#{dog.url}"))

    dog.story = doc.css(".pet-detail-page__info__story").css("p").text
    dog.shelter = doc.css(".pet-detail-page__info__org").css("h3").text
    dog.website = doc.css(".pet-detail-page__info__org").css(".pet-detail-page__info__org__web").css("a").attribute("href").value
  end
end
