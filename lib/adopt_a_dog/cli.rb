# CLI Controller

class AdoptADog::CLI

  def call
    puts "Welcome to Adopt a Dog!"
    puts "Enter zip code you want to search for dogs"
    # input = gets.chomp
    list_dogs
    menu
    goodbye
  end

  def list_dogs
    #get adoptable dogs
    @dogs = AdoptADog::Dogs.adoptable
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}, #{dog.name}, #{dog.sex}, #{dog.location}"
    end
  end

  def menu
    input = nil

    while input != "exit"
      puts "Enter the number of the dog you'd like more info on or type list to see list again or type exit:"
      input = gets.chomp.downcase

      if input.to_i > 0
        adoptable_dog = @dogs[input.to_i - 1]
        puts "#{adoptable_dog.name}, #{adoptable_dog.sex}, #{adoptable_dog.location}"
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
