class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person
  end

  def to_json(*_args)
    {
      'date' => @date,
      'person_id' => @person['id'],
      'person_name' => @person['name'],
      'book_title' => @book['title'],
      'book_author' => @book['author'],
      'class' => self.class.name
    }
  end
end
