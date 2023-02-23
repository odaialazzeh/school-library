require './student'
require './classroom'

describe Student do
  let(:student) { Student.new('math', 24, 'odai') }

  describe '#initialize' do
    it 'sets the age' do
      expect(student.age).to eq 24
    end

    it 'sets the classroom' do
      expect(student.classroom).to eq 'math'
    end

    it 'sets the name to' do
      expect(student.name).to eq 'odai'
    end

    context 'When the is provided' do
      let(:student) { Student.new('math', 24, 'Ben') }

      it 'sets the name' do
        expect(student.name).to eq 'Ben'
      end
    end
    context 'When parent permission is false' do
      let(:student) { Student.new(24, 'Ben', parent_permission: false) }
      it 'sets the parent permission to false' do
        expect(student.instance_variable_get(:@parent_permission)).to be false
      end
    end

    describe '#play_hoocky' do
      it 'returns pattern' do
        expect(student.play_hoocky).to eq '¯(ツ)/¯'
      end
    end

    describe '#to_json' do
      it 'returns hash representation of student' do
        expect(student.to_json).to eq(
          {
            'id' => student.id,
            'name' => student.name,
            'age' => student.age,
            'classroom' => student.classroom,
            'parent_permission' => true,
            'class' => 'Student'
          }
        )
      end
    end
  end
end
