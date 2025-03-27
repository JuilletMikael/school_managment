class Person < ApplicationRecord
  rolify  # Vérifie bien que cette ligne est présente !

  # Devise
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Associations
  belongs_to :address, optional: true
  belongs_to :person_status, optional: true
  belongs_to :classroom, optional: true


  after_create :assign_default_role

  private

  def assign_default_role
    case type
    when "Student"
      add_role(:student)
    when "Teacher"
      add_role(:teacher)
    when "Dean"
      add_role(:dean)
    end
  end
end
