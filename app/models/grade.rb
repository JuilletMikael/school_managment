class Grade < ApplicationRecord
  belongs_to :student, class_name: 'Student', foreign_key: 'person_id', optional: true
  belongs_to :examination, optional: true
  belongs_to :course, optional: true

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 6.0 }
  
  # Add this scope to find all grades for a specific student
  scope :for_student, ->(student_id) { where(person_id: student_id) }
  
  # Add this scope to find grades within a date range
  scope :in_date_range, ->(start_date, end_date) { where(created_at: start_date..end_date) }
  
  # For backward compatibility
  def value
    score
  end
  
  def value=(val)
    self.score = val
  end
end
