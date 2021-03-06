# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180524020223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_plans", force: :cascade do |t|
    t.bigint "semester_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_academic_plans_on_semester_id"
    t.index ["subject_id"], name: "index_academic_plans_on_subject_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brigade_memberships", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "brigade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brigade_id"], name: "index_brigade_memberships_on_brigade_id"
    t.index ["student_id"], name: "index_brigade_memberships_on_student_id"
  end

  create_table "brigades", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brigade_admin_id"
  end

  create_table "campus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_chat_rooms_on_student_id"
  end

  create_table "classes_timetables", force: :cascade do |t|
    t.bigint "semester_id"
    t.bigint "subgroup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_classes_timetables_on_semester_id"
    t.index ["subgroup_id"], name: "index_classes_timetables_on_subgroup_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "number"
    t.bigint "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campus_id"], name: "index_classrooms_on_campus_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratory_works", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document"
    t.integer "mark"
    t.bigint "student_id"
    t.bigint "academic_plan_id"
    t.bigint "teacher_id"
    t.date "end_date"
    t.date "load_date"
    t.index ["academic_plan_id"], name: "index_laboratory_works_on_academic_plan_id"
    t.index ["student_id"], name: "index_laboratory_works_on_student_id"
    t.index ["teacher_id"], name: "index_laboratory_works_on_teacher_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_type"
    t.date "lesson_date"
    t.time "lesson_time"
    t.bigint "classes_timetable_id"
    t.bigint "subject_id"
    t.bigint "teacher_id"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classes_timetable_id"], name: "index_lessons_on_classes_timetable_id"
    t.index ["classroom_id"], name: "index_lessons_on_classroom_id"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "student_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.string "key", null: false
    t.string "group_type"
    t.integer "group_id"
    t.integer "group_owner_id"
    t.string "notifier_type"
    t.integer "notifier_id"
    t.text "parameters"
    t.datetime "opened_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id"
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id"
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "practical_works", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document"
    t.integer "mark"
    t.bigint "student_id"
    t.bigint "academic_plan_id"
    t.bigint "teacher_id"
    t.date "end_date"
    t.date "load_date"
    t.index ["academic_plan_id"], name: "index_practical_works_on_academic_plan_id"
    t.index ["student_id"], name: "index_practical_works_on_student_id"
    t.index ["teacher_id"], name: "index_practical_works_on_teacher_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "project_admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raitings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
  end

  create_table "semesters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "st_id"
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subgroup_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["subgroup_id"], name: "index_students_on_subgroup_id"
  end

  create_table "students_project_memberships", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_students_project_memberships_on_project_id"
    t.index ["student_id"], name: "index_students_project_memberships_on_student_id"
  end

  create_table "subgroups", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_subgroups_on_group_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", id: :serial, force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "key", null: false
    t.boolean "subscribing", default: true, null: false
    t.boolean "subscribing_to_email", default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text "optional_targets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_subscriptions_on_key"
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "teachers_project_memberships", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_teachers_project_memberships_on_project_id"
    t.index ["teacher_id"], name: "index_teachers_project_memberships_on_teacher_id"
  end

  create_table "work_notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "academic_plans", "semesters"
  add_foreign_key "academic_plans", "subjects"
  add_foreign_key "brigade_memberships", "brigades"
  add_foreign_key "brigade_memberships", "students"
  add_foreign_key "chat_rooms", "students"
  add_foreign_key "classes_timetables", "semesters"
  add_foreign_key "classes_timetables", "subgroups"
  add_foreign_key "classrooms", "campus", column: "campus_id"
  add_foreign_key "laboratory_works", "academic_plans"
  add_foreign_key "laboratory_works", "students"
  add_foreign_key "laboratory_works", "teachers"
  add_foreign_key "lessons", "classes_timetables"
  add_foreign_key "lessons", "classrooms"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "students"
  add_foreign_key "practical_works", "academic_plans"
  add_foreign_key "practical_works", "students"
  add_foreign_key "practical_works", "teachers"
  add_foreign_key "students", "subgroups"
  add_foreign_key "students_project_memberships", "projects"
  add_foreign_key "students_project_memberships", "students"
  add_foreign_key "subgroups", "groups"
  add_foreign_key "teachers_project_memberships", "projects"
  add_foreign_key "teachers_project_memberships", "teachers"
end
