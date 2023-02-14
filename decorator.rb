require './nameable'

class Decorator < Nameable # rubocop:todo Style/Documentation
  def initialize(nameable) # rubocop:todo Lint/MissingSuper
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
