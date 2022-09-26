class Student < Person

 attr_accessor :classroom
 def initialize(classroom)
   super()
   @classroom = classroom
end

def play_hooky
 return "¯\(ツ)/¯"
end

end