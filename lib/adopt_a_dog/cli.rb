class AdoptADog::CLI
  attr_accessor :zip_code

  def call
    puts "Welcome to Adopt an Italian Greyhound!"
    puts "Please enter your zip code"
    zipcode_input = gets.chomp
    AdoptADog::Scraper.scrape_dogs(zipcode_input)
    list_dogs
    menu
    goodbye
  end

  def list_dogs
    puts "These dogs are available for adoption in your area:"
    puts
    dogs = AdoptADog::Dogs.all

    dogs.each.with_index(1) do |dog, i|
        puts "#{i}. #{dog.name.upcase}, a #{dog.sex} #{dog.breed} in #{dog.location}"
    end
    puts "\nTo view an individual dog's story, select 1-9."
  end

  def menu
    input = nil
      while input != "exit"
        input = gets.chomp.downcase

        if input.to_i > 0
          index = input.to_i - 1
          dog = AdoptADog::Dogs.all[index]
          if !dog.story
            AdoptADog::Scraper.scrape_profile_page(dog)
          end

          puts
          puts dog.story.gsub(/^\s*/, "")
          puts
          puts "To adopt #{dog.name}, please contact #{dog.shelter} at #{dog.website}"
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
