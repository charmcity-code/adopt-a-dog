class AdoptADog::CLI
  def call
    puts "Welcome to Adopt an Italian Greyhound!"
    scrape
    list_dogs
    menu
    goodbye
  end

  def scrape
    puts "Please enter your zip code"
    zipcode_input = gets.chomp
    AdoptADog::Scraper.scrape_dogs(zipcode_input)
    dogs = AdoptADog::Dogs.all

    if dogs.empty?
      puts "Unfortunately there are no adoptable Italian Greyhounds in your area.\nPlease try again with a different zip code."
      puts
      scrape
    end
  end

  def list_dogs
    @dogs = AdoptADog::Dogs.limit_nine
    puts "These dogs are available for adoption in your area:"
    puts
    @dogs.each.with_index(1) do |dog, i|
        puts "#{i}. #{dog.name.upcase}, #{dog.breed} in #{dog.location}."
    end
    puts "\nTo view an individual dog's story, select 1 - #{@dogs.length}"
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.chomp.downcase

      if input.to_i > 0 && input.to_i <= @dogs.length
        index = input.to_i - 1
        dog = AdoptADog::Dogs.all[index]
        if !dog.story
          AdoptADog::Scraper.scrape_profile_page(dog)
        end

        puts
        puts dog.story.gsub(/^\s*/, "")
        puts
        puts "To adopt #{dog.name} from #{dog.shelter}, please visit #{dog.url}"
        puts "\nTo see a list of adoptable dogs again, type list.\nTo exit type exit."
      elsif input == "list"
        list_dogs
      elsif input != "exit"
        puts "Try again... Type list or exit."
      end
    end
  end

  def goodbye
    puts "Thank you for looking at adoptable dogs."
  end
end
