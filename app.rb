require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './book_creation'
require './person_creation'
require './rental_creation'

class App
  attr_accessor :books_class, :person_class, :rental_class

  def initialize
    @books_class = BookLogic.new
    @person_class = PersonLogic.new
    @rental_class = RentalLogic.new
  end
end
