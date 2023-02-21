require './create_book'
require './add_rental'
require './add_person'

class App
  def initialize
    @books = CreateBook.new
    @people = AddPerson.new
    @rentals = AddRental.new(@people, @books)
  end

  def list_books
    @books.list
  end

  def list_people
    @people.list
  end

  def create_person
    @people.create_person
  end

  def create_book
    @books.create
  end

  def create_rental
    @rentals.create
  end

  def list_rentals
    @rentals.list
  end
end
