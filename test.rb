require './classroom'
require './person'
require './rental'
require './book'
require './student'


classroom = Classroom.new("History")

# create some students and add them to the classroom
student1 = Student.new(classroom, 16, 'Alice')
classroom.add_student(student1)

student2 = Student.new(classroom, 16, 'Bob')
classroom.add_student(student2)

# get the label of the classroom
puts classroom.label  # output: History

# get the students in the classroom
puts classroom.students.map(&:name)  # output: ["Alice", "Bob"]

# create some books and people
book1 = Book.new("To Kill a Mockingbird", "Harper Lee")
book2 = Book.new("1984", "George Orwell")

person1 = Person.new(30, "Charlie")
person2 = Person.new(25, "Diana")

# create some rentals
rental1 = Rental.new('2023, 2, 15', book1, person1)
rental2 = Rental.new('2023, 2, 16', book2, person2)

# get the rentals for a book
puts book1.rentals.map(&:person).map(&:name)  # output: [Charlie]

# get the rentals for a person
puts person1.rentals.map(&:book).map(&:title) # output: ["To Kill a Mockingbird"]