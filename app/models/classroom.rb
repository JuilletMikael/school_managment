class Classroom < ApplicationRecord
  belongs_to :room
  has_many :courses, foreign_key: "classroom_id"
  has_many :students
  belongs_to :master, class_name: 'Teacher', optional: true
end
