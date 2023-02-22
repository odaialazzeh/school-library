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

  def to_json(*_args)
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization,
      'class' => self.class.name
    }
  end
end
