class Subject < ApplicationRecord
  has_many :courses, foreign_key: "subject_id"
  belongs_to :teacher, optional: true
end
