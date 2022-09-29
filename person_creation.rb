require './person'
require './student'
require './teacher'
require './data_db'

class PersonLogic
  include DataDb

  def initialize
    @person = DataDb.persons
  end

  attr_accessor :persons

  def person_input
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    input = gets.chomp.to_i
    case input
    when 1
      student_input
    when 2
      teacher_input
    end
  end

  def student_input
    print 'Name:'
    name = gets.chomp.capitalize!
    print 'age:'
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]:'
    boo = gets.chomp
    parent_permission = %w[Y y].include?(boo)
    print 'ID:'
    id = gets.chomp.to_i
    add_student(age, name, id, parent_permission)
    print 'Student created successfully!'
    sleep(2)
    main
  end

  def teacher_input
    print 'Name:'
    name = gets.chomp.capitalize!
    print 'Age:'
    age = gets.chomp.to_i
    print 'Specialization:'
    specialization = gets.chomp.capitalize!
    print 'ID:'
    id = gets.chomp.to_i
    add_teacher(name, age, specialization, id)
    print 'Person created successfully!'
    sleep(2)
    main
  end

  def add_teacher(age, name, id, specialization)
    teacher = Teacher.new(name, age, id, specialization)
    @person.push(teacher)
  end

  def add_student(age, name, id, parent_permission)
    student = Student.new(age, name, id, parent_permission)
    @person.push(student)
  end

  def list_people
    case @person.length
    when 0
      puts 'There are no people in the library'
    else
      puts 'Here are all the people in the library:'
      @person.each do |pers|
        puts "[#{pers.ps}] Name: #{pers.name}, ID: #{pers.id}, Age: #{pers.age}"
      end
    end
    sleep(3)
    main
  end
end
