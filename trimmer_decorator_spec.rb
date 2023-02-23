require './nameable'
require './decorator'
require './trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { instance_double(Nameable, correct_name: '1234567890abcdefghij') }
  let(:decorator) { Decorator.new(nameable) }
  subject { described_class.new(decorator) }

  describe '#correct_name' do
    it 'calls the correct_name method on the decorated object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end

    it 'trims the result of the correct_name method on the decorated object if it is longer than 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('1234567890abcdefghij')
      expect(subject.correct_name).to eq('1234567890')
    end

    it 'does not trim the result of the correct_name method on the
        decorated object if it is 10 characters or shorter' do
      allow(nameable).to receive(:correct_name).and_return('1234567890')
      expect(subject.correct_name).to eq('1234567890')
    end
  end
end