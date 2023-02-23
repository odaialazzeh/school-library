require './nameable'
require './decorator'

describe Decorator do
  let(:nameable) { instance_double(Nameable, correct_name: 'foo') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'calls the correct_name method on the nameable object' do
      expect(nameable).to receive(:correct_name)
      subject.correct_name
    end

    it 'returns the value returned by the nameable object' do
      expect(subject.correct_name).to eq('foo')
    end
  end
end
