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
  end

  def menu
    input = nil

    while input != "exit"
      puts "Enter the number of the dog you'd like more info on or type list to see list again or type exit:"
      input = gets.chomp.downcase
      case input
      when "1"
        puts "More info on Dog Name 1..."
      when "2"
        puts "More info on Dog Name 2..."
      when "list"
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
