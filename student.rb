require_relative 'person'

class Student < Person
  attr_accessor :classroomm

  def initialize(age, classroomm, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroomm
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroomm)
    @classroom = classroomm
    classroom.students << self unless classroom.students.include?(self)
  end
end
