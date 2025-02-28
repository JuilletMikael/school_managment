class Subject < ApplicationRecord
  has_many :courses, foreign_key: "subject_id"
end
