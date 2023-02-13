# frozen_string_literal: true

require './person'

# Create class Student
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hoocky
    '¯(ツ)/¯'
  end
end
