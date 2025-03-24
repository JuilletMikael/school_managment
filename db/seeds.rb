# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Seed using fixtures
require 'active_record/fixtures'

# List of fixture files to load
fixture_files = [
  'person_statuses',
  'addresses',
  'roles',
  'people',
  'rooms',
  'subjects',
  'classrooms',
  'courses',
  'examinations',
  'grades'
]

# Load each fixture file
fixture_files.each do |fixture|
  puts "Loading #{fixture} fixtures..."
  ActiveRecord::FixtureSet.create_fixtures('test/fixtures', fixture)
end

puts "Database seeded successfully from fixtures!"

# After loading fixtures, you may need to run additional setup code
# For example, to ensure roles are properly assigned
if defined?(Person)
  Person.find_each do |person|
    case person.type
    when "Student"
      person.add_role(:student) unless person.has_role?(:student)
    when "Teacher"
      person.add_role(:teacher) unless person.has_role?(:teacher)
    when "Dean"
      person.add_role(:dean) unless person.has_role?(:dean)
    end
  end
  puts "Roles assigned to existing people"
end
