class AddMasterToClassrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :classrooms, :master, foreign_key: { to_table: :people }, null: true
  end
end 