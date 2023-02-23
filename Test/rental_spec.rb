require './rental'

describe Rental do
  let(:book) { { 'title' => '1984', 'author' => 'George Orwell' } }
  let(:person) { { 'id' => 498, 'name' => 'odai' } }
  let(:date) { '2023/02/21' }
  subject(:rental) { Rental.new(book, person, date) }

  describe '#initialize' do
    it 'sets the book' do
      expect(rental.book).to eq(book)
    end

    it 'sets the person' do
      expect(rental.person).to eq(person)
    end

    it 'sets the date' do
      expect(rental.date).to eq(date)
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the rental object' do
      expected_output = {
        'date' => date,
        'person_id' => person['id'],
        'person_name' => person['name'],
        'book_title' => book['title'],
        'book_author' => book['author'],
        'class' => Rental.name
      }

      expect(rental.to_json).to eq expected_output
    end
  end
end
