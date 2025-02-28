class Course < ApplicationRecord
  belongs_to :classroom
  belongs_to :subject
  has_many :examinations, foreign_key: "course_id"
end
