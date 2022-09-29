require './data_db'

class RentalLogic
  include DataDb

  attr_accessor :rentals, :persons, :books

  def initialize
    @rental = DataDb.rentals
    @persons = DataDb.persons
    @books = DataDb.books
  end

  def list_books_by_index
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_persons_by_index
    @persons.each_with_index do |person, i|
      puts "#{i}) Name: #{person.name}, Age: #{person.age}"
    end
  end

  def rental_creation
    if @persons.length.zero? || @books.length.zero?
      puts 'There are no people or books in the library'
    else
      rental_confirmation
    end
    sleep(2)
    main
  end

  def rental_confirmation
    puts 'Select a book from the following list by number(not ID):'
    @books.each_with_index do |book, i|
      puts "#{i}) Title: #{book.title}, Author: #{book.author}"
    end
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID):'
    @persons.each_with_index do |person, i|
      puts "#{i}) Name: #{person.name}, Age: #{person.age}"
    end
    person = gets.chomp.to_i
    print 'Date (YYYY-MM-DD):'
    date = gets.chomp
    rental = Rental.new(@books[book], @persons[person], date)
    @rental.push(rental)
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person
    print 'ID of person : '
    id = gets.chomp.to_i
    res = @persons.find { |pers| pers.id == id }
    if res.nil?
      puts 'There is no person with that ID'
    else
      puts "Here are all the rentals for #{res.name}:"
      @rental.each do |rental|
        puts "Title: #{rental.book.title}, Author: #{rental.book.author}" if rental.person.id == id
      end
    end
    sleep(2)
    main
  end
end
