class AddClassroomToStudents < ActiveRecord::Migration[8.0]
  def change
    add_reference :students, :classroom, foreign_key: true
  end
end 