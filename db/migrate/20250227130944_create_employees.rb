class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :iban
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
