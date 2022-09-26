require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
