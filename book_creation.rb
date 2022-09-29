require './book'
require './data_db'

class BookLogic
  include DataDb

  attr_accessor :books

  def initialize
    @books = DataDb.books
  end

  def list_books
    case @books.length
    when 0
      puts 'There are no books in the library'
    else
      puts 'Here are all the books in the library:'
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    sleep(2)
    main
  end

  def add_book
    print 'Title:'
    title = gets.chomp.capitalize!
    print 'Author:'
    author = gets.chomp.capitalize!
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully!'
    sleep(2)
    main
  end
end
