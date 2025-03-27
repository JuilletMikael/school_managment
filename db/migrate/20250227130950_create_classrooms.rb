class CreateClassrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :classrooms do |t|
      t.string :uid
      t.string :name
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
