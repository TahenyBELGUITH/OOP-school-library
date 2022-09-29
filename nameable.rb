class Nameable
  attr_accessor :nameable

  def correct_name
    raise NotImplementedError
  end
end
