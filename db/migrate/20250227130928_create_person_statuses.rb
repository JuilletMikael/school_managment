class CreatePersonStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :person_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
