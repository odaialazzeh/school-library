require './teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 35, 'moses') }

  describe '#initialize' do
    it 'sets the specialization' do
      expect(teacher.specialization).to eq('Math')
    end

    it 'sets the age' do
      expect(teacher.age).to eq(35)
    end

    it 'sets the name' do
      expect(teacher.name).to eq('moses')
    end

    context 'When other data is provided' do
      let(:teacher) { Teacher.new('sport', 55, 'Jamal') }

      it 'sets the specialization' do
        expect(teacher.specialization).to eq('sport')
      end

      it 'sets the age' do
        expect(teacher.age).to eq(55)
      end

      it 'sets the name' do
        expect(teacher.name).to eq('Jamal')
      end
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#to_json' do
    it 'returns hash representation of the teacher' do
      expect(teacher.to_json).to eq(
        {
          'id' => teacher.id,
          'name' => teacher.name,
          'age' => teacher.age,
          'specialization' => teacher.specialization,
          'class' => 'Teacher'
        }
      )
    end
  end
end
