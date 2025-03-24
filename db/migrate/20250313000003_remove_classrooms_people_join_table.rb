class RemoveClassroomsPeopleJoinTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :classrooms_people, if_exists: true
  end
end 