class Classroom < ApplicationRecord
  belongs_to :room
  has_many :courses, foreign_key: "classroom_id"
end
