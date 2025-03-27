class Role < ApplicationRecord
  has_and_belongs_to_many :persons, join_table: :persons_roles
  belongs_to :resource, polymorphic: true, optional: true
end
