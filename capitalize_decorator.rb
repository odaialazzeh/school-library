require './decorator'

class CapitalizeDecorator < Decorator # rubocop:todo Style/Documentation
  def correct_name
    @nameable.correct_name.capitalize
  end
end
