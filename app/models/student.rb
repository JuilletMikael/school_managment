class Student < Person
  belongs_to :classroom, optional: true
  has_many :grades
end
