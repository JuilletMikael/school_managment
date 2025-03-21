class Course < ApplicationRecord
  belongs_to :classroom
  belongs_to :subject
  belongs_to :teacher, class_name: 'Teacher', foreign_key: 'teacher_id'
  
  has_many :examinations, foreign_key: "course_id", dependent: :destroy
  has_many :grades, dependent: :destroy
  has_many :students, -> { distinct }, through: :classroom

  validates :name, presence: true

  def name
    subject.try(:name) || read_attribute(:name)
  end
end
