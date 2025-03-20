class AddTeacherIdToClassrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :classrooms, :teacher, foreign_key: { to_table: :people }, null: true
  end
end 