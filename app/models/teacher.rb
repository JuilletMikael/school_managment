class Teacher < Person
  attr_accessor :iban
  
  has_many :courses, foreign_key: 'teacher_id'
  has_many :examinations, through: :courses
  has_many :subjects, through: :courses
  has_many :classrooms, -> { distinct }, through: :courses
  has_many :students, -> { distinct }, through: :classrooms

  def full_name
    "#{first_name} #{last_name}"
  end
end
