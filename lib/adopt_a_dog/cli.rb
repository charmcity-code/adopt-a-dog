class AdoptADog::CLI
  attr_accessor :zip_code

  def call
    puts "Welcome to Adopt an Italian Greyhound!"
    AdoptADog::Scraper.scrape_dogs
    list_dogs
    more_info
  end

  def list_dogs
    puts "These dogs are available for adoption in the Baltimore area:"
    puts
    dogs = AdoptADog::Dogs.all

    dogs.each.with_index(1) do |dog, i|
        puts "#{i}. #{dog.name.upcase}, a #{dog.sex} #{dog.breed} in #{dog.location}"
    end
  end

  def more_info
    puts "To view an individual dog's story, select 1-9"
    input = gets.chomp
    index = input.to_i - 1

    dog = AdoptADog::Dogs.all[index]
    AdoptADog::Scraper.scrape_profile_page(dog)

    puts
    puts dog.story.gsub(/^\s*/, "")
    puts
    puts "To adopt #{dog.name}, please contact #{dog.shelter} at #{dog.website}"
  end

end
