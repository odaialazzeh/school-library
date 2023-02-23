require './book'
require './rental'

describe Book do
  let(:book) { Book.new('Don Quixote', 'Miguel de Cervantes') }
  let(:person) { 'Odai' }
  let(:date) { '22/02/2023' }

  before do
    allow(Rental).to receive(:new).with(person, date, book).and_return(rental)
  end

  let(:rental) { double(:rental) }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq('Don Quixote')
      expect(book.author).to eq('Miguel de Cervantes')
    end

    it 'initializes an empty array of rentals' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      book.add_rental(person, date)
      expect(book.rentals.count).to eq(1)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the book' do
      book.add_rental(person, date)
      json = book.to_json
      expect(json).to eq({
                           'title' => book.title,
                           'author' => book.author,
                           'rentals' => [rental],
                           'class' => 'Book'
                         })
    end
  end
end
