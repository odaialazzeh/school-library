require './classroom'
require './student'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }

  describe '#label' do
    it 'returns the correct label' do
      expect(classroom.label).to eq('Math')
    end
  end

  describe '#students' do
    it 'returns an empty array when there are no students' do
      expect(classroom.students).to be_empty
    end

    it 'returns an array of students when there are students' do
      student1 = Student.new('Alice', 12)
      student2 = Student.new('Bob', 13)
      classroom.add_student(student1)
      classroom.add_student(student2)
      expect(classroom.students).to match_array([student1, student2])
    end
  end

  describe '#add_student' do
    let(:student) { Student.new('Alice', 12) }

    it 'adds a student to the classroom' do
      expect { classroom.add_student(student) }.to change { classroom.students.length }.by(1)
    end

    it 'sets the student classroom to the current classroom' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
