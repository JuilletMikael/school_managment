class AddPeopleToSubjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :subjects, :People, foreign_key: true
  end
end 