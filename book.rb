require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    @rentals << Rental.new(person, date, self)
  end

  def to_json(*_args)
    {
      'title' => @title,
      'author' => @author,
      'class' => self.class.name
    }
  end
end
