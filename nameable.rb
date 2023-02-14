class Nameable # rubocop:todo Style/Documentation
  def correct_name
      # rubocop:todo Layout/IndentationWidth
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    # rubocop:enable Layout/IndentationWidth
  end
end
