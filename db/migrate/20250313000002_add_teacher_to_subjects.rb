class AddTeacherToSubjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :subjects, :teacher, foreign_key: true
  end
end 