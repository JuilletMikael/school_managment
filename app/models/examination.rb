class Examination < ApplicationRecord
  belongs_to :course
  has_many :grades, foreign_key: :examination_id
end
