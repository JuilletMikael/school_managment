class Teacher < Employee
  has_and_belongs_to_many :classrooms
end
