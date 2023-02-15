require './classroom'
require './person'
require './rental'
require './book'
require './student'

room = Classroom.new('A1')
student = Student.new(room, 16, 'John Doe')
room.add_student(student)
book = Book.new('War and Peace', 'Leo Tolstoy')

puts room.label
# Output: "A1"
puts room.students.first.name
# Output: "John Doe"
puts book.title
# Output: "War and Peace"
puts book.author
# Output: "Leo Tolstoy"
