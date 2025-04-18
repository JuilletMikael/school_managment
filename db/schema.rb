# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_22_144500) do
  create_table "addresses", force: :cascade do |t|
    t.integer "zip"
    t.string "town"
    t.string "street"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "master_id"
    t.index ["master_id"], name: "index_classrooms_on_master_id"
    t.index ["room_id"], name: "index_classrooms_on_room_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "term"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "week_day"
    t.integer "classroom_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_courses_on_classroom_id"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "examinations", force: :cascade do |t|
    t.string "title"
    t.datetime "expected_date"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_examinations_on_course_id"
  end

  create_table "grades", force: :cascade do |t|
    t.decimal "value"
    t.datetime "effective_date"
    t.integer "examination_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_grades_on_examination_id"
    t.index ["person_id"], name: "index_grades_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "username"
    t.string "lastname"
    t.string "firstname"
    t.string "email"
    t.string "phone_number"
    t.integer "address_id", null: false
    t.integer "person_status_id", null: false
    t.integer "classroom_id"
    t.string "type"
    t.string "iban"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["address_id"], name: "index_people_on_address_id"
    t.index ["classroom_id"], name: "index_people_on_classroom_id"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["person_status_id"], name: "index_people_on_person_status_id"
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "people_roles", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "role_id"
    t.index ["person_id", "role_id"], name: "index_people_roles_on_person_id_and_role_id"
    t.index ["person_id"], name: "index_people_roles_on_person_id"
    t.index ["role_id"], name: "index_people_roles_on_role_id"
  end

  create_table "person_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "People_id"
    t.index ["People_id"], name: "index_subjects_on_People_id"
  end

  add_foreign_key "classrooms", "people", column: "master_id"
  add_foreign_key "classrooms", "rooms"
  add_foreign_key "courses", "classrooms"
  add_foreign_key "courses", "subjects"
  add_foreign_key "examinations", "courses"
  add_foreign_key "grades", "examinations"
  add_foreign_key "grades", "people"
  add_foreign_key "people", "addresses"
  add_foreign_key "people", "classrooms"
  add_foreign_key "people", "person_statuses"
  add_foreign_key "subjects", "People", column: "People_id"
end
