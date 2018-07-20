class AdoptADog::CLI

  def call
    puts "Welcome to Adopt a Dog!"
    puts "Enter zip code you want to search for dogs"
    # input = gets.chomp
    list_dogs
    get_about_info
    menu
    goodbye
  end

  def list_dogs
    @dogs = AdoptADog::Dogs.scrape_dogs
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. #{dog[:name].upcase}, a #{dog[:sex]} #{dog[:breed]} in #{dog[:location]}"
    end
  end

  def get_about_info
    AdoptADog::Dogs.all.each do |dog|
      about = AdoptADog::Dogs.scrape_profile_page(dog.url)
      about.add_info(about)
      puts dog
    end
  end

  def menu
    input = nil

    while input != "exit"
      puts "Enter the number of the dog you'd like more info on or type list to see list again or type exit:"
      input = gets.chomp.downcase

      if input.to_i == 1
        adoptable_dog = @dogs[input.to_i - 1]
        puts "#{adoptable_dog[:name]}"
      elsif input == "list"
        list_dogs
      else
        puts "Not sure? Type list or exit"
      end
    end
  end

  def goodbye
    puts "Thank you for looking for an adoptable dog."
  end
end
