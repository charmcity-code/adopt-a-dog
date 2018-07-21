class AdoptADog::CLI


  def call
    puts "Welcome to Adopt a Dog!"
    puts "Enter zip code you want to search for dogs"
    # input = gets.chomp

    AdoptADog::Scraper.scrape_dogs
    main_menu

  end

  def main_menu
    puts "Here are some dogs available for adoption:"
    dogs = AdoptADog::Dogs.all

    dogs.each.with_index(1) do |dog, i|
        puts "#{i}. #{dog.name.upcase}, a #{dog.sex} #{dog.breed} in #{dog.location}"
    end

    puts "Select dog to view additional info"
    input = gets.chomp
    index = input.to_i - 1

    dog = AdoptADog::Dogs.all[index]

    AdoptADog::Scraper.scrape_profile_page(dog)

    puts "Here are the details"
    puts dog.story
    puts dog.shelter
    puts dog.website

    main_menu
  end

  # def list_dogs
  #   @dogs = AdoptADog::Scraper.scrape_dogs("https://www.petsmartcharities.org/find-a-pet-results?city_or_zip=21234&species=dog&color_id&geo_range=50&pet_size_range_id&sex&age=&breed_id=69")
  #
  #   @dogs.each.with_index(1) do |dog, i|
  #     puts "#{i}. #{dog[:name].upcase}, a #{dog[:sex]} #{dog[:breed]} in #{dog[:location]}"
  #   end
  #
  # end
  #
  # def add_about_info
  #   url = @dogs[:url]
  #   Dogs.all.each do |dog|
  #     info = AdoptADog::Scraper.scrape_profile_page(url)
  #     dog.Dogs.add_info(info)
  #     puts info
  #   end
  # end




end
