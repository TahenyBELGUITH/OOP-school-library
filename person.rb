class Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
