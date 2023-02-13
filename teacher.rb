# frozen_string_literal: true

require './person'

# Create class Teacher
class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('John Doe', 32, 'Mathematics')
puts teacher.name
puts teacher.age
puts teacher.specialization
puts teacher.can_use_services?
