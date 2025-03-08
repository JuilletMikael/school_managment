class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :term
      t.datetime :start_at
      t.datetime :end_at
      t.integer :week_day
      t.references :classroom, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
