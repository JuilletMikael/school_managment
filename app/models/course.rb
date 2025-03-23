class Course < ApplicationRecord
  belongs_to :classroom
  belongs_to :subject
  # Removing invalid teacher association since there's no teacher_id column
  # belongs_to :teacher, class_name: 'Teacher', foreign_key: 'teacher_id', optional: true
  
  has_many :examinations, foreign_key: "course_id", dependent: :destroy
  has_many :grades, dependent: :destroy
  has_many :students, -> { distinct }, through: :classroom

  validates :name, presence: true

  def name
    read_attribute(:name) || subject.try(:name)
  end
  
  # Use this to safely get the name when subject might be nil
  def display_name
    name || "Unnamed Course"
  end
end
