require './person'
require './student'
require './classroom'
require './teacher'

class AddPerson
  attr_accessor :people

  def initialize
    file_path = File.join('JSON_store', 'person.json')
    File.write(file_path, '[]') unless File.exist?(file_path)
    file_content = File.read(file_path)
    @people = file_content.empty? ? [] : JSON.parse(file_content)
  rescue StandardError => e
    puts "Error: #{e.message} while loading books from file #{file_path}"
    @people = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp.to_i
    case select_person
    when 1
      create_student
    when 2
      create_teacher
    else
      puts "\n\n******** Invalid input, please try again!!! ************ \n\n"
      create_person
    end
  end

  def create_student
    print 'Classroom: '
    s_classroom = gets.chomp
    print 'Age: '
    student_age = gets.chomp.to_i
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else puts "That is not a valid input. Please try again!!!.\n\n"
         create_student
    end
    student = Student.new(s_classroom, student_age, student_name, parent_permission: parent_permission)
    @people << student.to_json
    to_file
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp.to_i
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp
    teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)
    @people << teacher.to_json
    to_file
    puts 'Teacher created successfully'
  end

  def list
    if @people.empty?
      puts 'No people found. Please add some people to the list first.'
    else

      @people.each_with_index do |person, index|
        print "#{index}) [#{person['class']}] ID: #{person['id']}, Name: #{person['name']}, Age: #{person['age']}"
        if person['class'] == 'Student'
          puts ",classroom: #{person['classroom']}"
        else
          puts ",specialization: #{person['specialization']}"
        end
      end
    end
    nil
  end

  def to_file
    json_data = JSON.pretty_generate(@people)
    File.write(File.join('JSON_store', 'person.json'), json_data)
  end
end
