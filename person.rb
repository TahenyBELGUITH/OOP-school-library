class Person
attr_accessor :id, :name, :age
def initialize(name = "Unknown", age, parent_permission = true)
 @name = name
 @age = age
 @parent_permission = parent_permission
end

def id 
 @id
end

def name 
 @name
end

def age 
 @age
end

def name = (value)
 @name = value
end

def age = (value)
 @age = value
end

private
def is_of_age?(age)
 if age >= 18 
  return true
 else
  return false
 end

end

def can_use_services?(age, parent_permission)
  if age >= 18 || parent_permission
   return true
  else
   return false
  end
end

end