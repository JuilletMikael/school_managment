class Student < Person
  belongs_to :classroom, optional: true
  has_many :grades, foreign_key: 'person_id'
  has_many :courses, through: :grades

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_repeat_courses?
    # Group grades by course_id and check if any course has multiple records
    grades.group_by(&:course_id).any? { |_, course_grades| course_grades.size > 1 }
  end
  
  # Fallback methods in case of database schema issues
  def classroom_name
    classroom&.name || "Not assigned"
  end
  
  def first_name
    firstname || ""
  end
  
  def last_name
    lastname || ""
  end
end
