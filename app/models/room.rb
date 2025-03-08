class Room < ApplicationRecord
  has_many :classrooms, foreign_key: "room_id"
end
