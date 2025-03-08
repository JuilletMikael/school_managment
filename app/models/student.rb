class Student < Person
  has_and_belongs_to_many :classrooms
  has_many :grades, foreign_key: 'student_id'
end
