class RemoveClassroomsStudentsJoinTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :classrooms_students, if_exists: true
  end
end 