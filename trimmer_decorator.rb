require './decorator'

class TrimmerDecorator < Decorator # rubocop:todo Style/Documentation
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
