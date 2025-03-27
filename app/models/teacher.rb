class Teacher < Person
  attr_accessor :iban
  
  has_many :courses, foreign_key: 'teacher_id'
  has_many :examinations, through: :courses
  has_many :subjects, through: :courses
  has_many :classrooms, -> { distinct }, through: :courses
  has_many :students, -> { distinct }, through: :classrooms
  has_many :master_classrooms, class_name: 'Classroom', foreign_key: 'master_id'

  def full_name
    "#{firstname} #{lastname}"
  end
end
