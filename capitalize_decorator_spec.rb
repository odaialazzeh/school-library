require './nameable'
require './decorator'
require './capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { instance_double(Nameable, correct_name: 'foo') }
  let(:decorator) { Decorator.new(nameable) }
  subject { described_class.new(decorator) }

  describe '#correct_name' do
    it 'calls the correct_name method on the decorated object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end

		it 'capitalizes the result of the correct_name method on the decorated object' do
      allow(nameable).to receive(:correct_name).and_return('foo')
      expect(subject.correct_name).to eq('Foo')
    end
  end
end