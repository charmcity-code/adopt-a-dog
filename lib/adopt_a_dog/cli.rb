class AdoptADog::CLI
  attr_accessor :zip_code

  def call
    puts "Welcome to Adopt an Italian Greyhound!"
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

end
