require './person'
require './book'
require './student'
require './classroom'
require './rental'
require './teacher'

class App
  def initialize
    @books = []
    @students = []
    @teachers = []
    @people = []
    @rentals = []
  end

  # ========================== show list of books ================================
  def list_books
    if @books.empty?
      puts 'No books found. Please add some books to the list.'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
    nil
  end

  # ========================= show list of people method =========================
  def list_people
    print 'Do you want to display list of a students (1) or a teachers (2)? [Input the number]: '
    list_person = gets.chomp.to_i
    case list_person
    when 1
      list_student
    when 2
      list_teacher
    else
      puts "\n\n******** Invalid input, please try again!!! ************ \n\n"
      list_person
    end
  end

  def list_student
    if @students.empty?
      puts 'No students found. Please add some students to the list first.'
    else
      @students.each_with_index do |student, index|
        puts "#{index}) [#{student.class}] ID: #{student.id}, Name: #{student.name},
        Age: #{student.age}, classroom: #{student.classroom}"
      end
    end
    nil
  end

  def list_teacher
    if @teachers.empty?
      puts 'No teachers found. Please add some teachers to the list first.'
    else
      @teachers.each_with_index do |teacher, index|
        puts "#{index}) [#{teacher.class}] ID: #{teacher.id}, Name: #{teacher.name},
        Age: #{teacher.age}, specialization: #{teacher.specialization}"
      end
    end
    nil
  end

  # ========================= Create a person method ==============================
  def create_person
    print 'Do you want to add a student (1) or a teacher (2)? [Input the number]: '
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
    student_classroom = gets.chomp
    print 'Age: '
    student_age = gets.chomp.to_i
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    student = Student.new(student_classroom, student_age, student_name, parent_permission: parent_permission)
    @students << student
    @people << student
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
    @teachers << teacher
    @people << teacher
    puts 'Teacher created successfully'
  end

  # ========================= Create a book method =============================
  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    book = Book.new(book_title, book_author)
    @books << book
    puts 'Book created successfully'
  end

  # ========================= Create a rental method =============================

  def display_people
    if @people.empty?
      puts 'No people found. Please add some people to the list first.'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
    nil
  end

  def create_rental
    if @books.empty? || (@teachers.empty? && @students.empty?)
      puts 'list are empty'
    else
      puts 'Select a book from the following list by number'
      list_books
      book_number = gets.chomp.to_i
      book_name = @books[book_number]

      puts 'Select a person from the following list by number (not id)'
      display_people
      person_number = gets.chomp.to_i
      person_name = @people[person_number]

      print 'Date:'
      date = gets.chomp
      rental = Rental.new(book_name, person_name, date)
      @rentals << rental
      puts 'Rental created successfully'
    end
    nil
  end

  # ========================== show list of rentals ================================
  def list_rentals
    if @rentals.empty?
      puts 'No rentals found, please add some rentals to the list first.'
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
    end
    nil
  end
end
