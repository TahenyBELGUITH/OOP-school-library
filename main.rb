require './app'

def main
  puts 'Welcome to School Library App!'
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a specific person'
  puts '7 - Exit'
  option = gets.chomp.to_i
  choice = Choice.new(option)
  choice.selected
end

class Choice
  def initialize(option)
    @option = option
  end
  Appl = App.new
  # rubocop:disable Metrics/CyclomaticComplexity
  def selected
    case @option
    when 1
      Appl.books_class.list_books
    when 2
      Appl.person_class.list_people
    when 3
      Appl.person_class.person_input
    when 4
      Appl.books_class.add_book
    when 5
      Appl.rental_class.rental_creation
    when 6
      Appl.rental_class.list_rentals_for_person
    when 7
      puts 'Thank you for using this app!'
      exit
    else
      puts 'Invalid option'
      main
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

main
