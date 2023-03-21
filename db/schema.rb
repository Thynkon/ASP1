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

ActiveRecord::Schema[7.0].define(version: 2023_03_06_145506) do
  create_table "categories", force: :cascade do |t|
    t.string "slug", limit: 20
    t.string "name"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["rgt"], name: "index_categories_on_rgt"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "zip_code"], name: "index_cities_on_name_and_zip_code", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "slug", limit: 20
    t.string "title"
    t.text "description"
    t.integer "quarter_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["quarter_id"], name: "index_courses_on_quarter_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.decimal "grade"
    t.integer "exam_id", null: false
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_evaluations_on_exam_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
    t.index ["teacher_id"], name: "index_evaluations_on_teacher_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.decimal "weight"
    t.datetime "passed_at", default: "2023-03-21 16:15:36"
    t.integer "person_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
    t.index ["person_id"], name: "index_exams_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "address"
    t.date "birthdate"
    t.string "acronym"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "type"
    t.index ["city_id"], name: "index_people_on_city_id"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "person_has_roles", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_has_roles_on_person_id"
    t.index ["role_id"], name: "index_person_has_roles_on_role_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.datetime "started_at", precision: nil
    t.datetime "ended_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_promotions_on_name", unique: true
  end

  create_table "quarters", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_quarters_on_semester_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_roles_on_slug", unique: true
  end

  create_table "semesters", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_belongs_to_promotions", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
    t.integer "person_id", null: false
    t.integer "promotion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_student_belongs_to_promotions_on_person_id"
    t.index ["promotion_id"], name: "index_student_belongs_to_promotions_on_promotion_id"
  end

  create_table "student_participates_in_semesters", force: :cascade do |t|
    t.boolean "conditional", default: false
    t.integer "students_id", null: false
    t.integer "semesters_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semesters_id"], name: "index_student_participates_in_semesters_on_semesters_id"
    t.index ["students_id"], name: "index_student_participates_in_semesters_on_students_id"
  end

  create_table "teacher_teaches_courses", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_teacher_teaches_courses_on_course_id"
    t.index ["person_id"], name: "index_teacher_teaches_courses_on_person_id"
  end

  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "quarters"
  add_foreign_key "evaluations", "exams"
  add_foreign_key "evaluations", "students"
  add_foreign_key "evaluations", "teachers"
  add_foreign_key "exams", "courses"
  add_foreign_key "exams", "people"
  add_foreign_key "people", "cities"
  add_foreign_key "person_has_roles", "people"
  add_foreign_key "person_has_roles", "roles"
  add_foreign_key "quarters", "semesters"
  add_foreign_key "student_belongs_to_promotions", "people"
  add_foreign_key "student_belongs_to_promotions", "promotions"
  add_foreign_key "student_participates_in_semesters", "semesters", column: "semesters_id"
  add_foreign_key "student_participates_in_semesters", "students", column: "students_id"
  add_foreign_key "teacher_teaches_courses", "courses"
  add_foreign_key "teacher_teaches_courses", "people"
end
