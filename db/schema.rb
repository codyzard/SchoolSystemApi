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

ActiveRecord::Schema.define(version: 2019_12_03_130245) do

  create_table "announces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lop_hoc_id"
    t.bigint "teacher_id"
    t.index ["lop_hoc_id"], name: "index_announces_on_lop_hoc_id"
    t.index ["teacher_id"], name: "index_announces_on_teacher_id"
  end

  create_table "documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "docType"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.bigint "storage_id"
    t.index ["storage_id"], name: "index_documents_on_storage_id"
    t.index ["subject_id"], name: "index_documents_on_subject_id"
  end

  create_table "grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "fileName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.bigint "grade_id"
    t.bigint "subject_id"
    t.index ["grade_id"], name: "index_lessons_on_grade_id"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "lop_hocs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "grade_id"
    t.index ["grade_id"], name: "index_lop_hocs_on_grade_id"
  end

  create_table "lop_hocs_teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lop_hoc_id"
    t.bigint "teacher_id"
    t.index ["lop_hoc_id"], name: "index_lop_hocs_teachers_on_lop_hoc_id"
    t.index ["teacher_id"], name: "index_lop_hocs_teachers_on_teacher_id"
  end

  create_table "messes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "room_id"
    t.index ["room_id"], name: "index_messes_on_room_id"
    t.index ["user_id"], name: "index_messes_on_user_id"
  end

  create_table "parents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_role_id"], name: "index_parents_on_user_role_id"
  end

  create_table "room_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "score_arrs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.bigint "subject_id"
    t.index ["student_id"], name: "index_score_arrs_on_student_id"
    t.index ["subject_id"], name: "index_score_arrs_on_subject_id"
  end

  create_table "scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "type"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "score_arr_id"
    t.index ["score_arr_id"], name: "index_scores_on_score_arr_id"
  end

  create_table "storages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_storages_on_teacher_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.bigint "lop_hoc_id"
    t.index ["lop_hoc_id"], name: "index_students_on_lop_hoc_id"
    t.index ["parent_id"], name: "index_students_on_parent_id"
    t.index ["user_role_id"], name: "index_students_on_user_role_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "admin", default: false
    t.bigint "user_role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_teachers_on_subject_id"
    t.index ["user_role_id"], name: "index_teachers_on_user_role_id"
  end

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "role"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "address"
    t.datetime "birthday"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "announces", "lop_hocs"
  add_foreign_key "announces", "teachers"
  add_foreign_key "documents", "storages"
  add_foreign_key "documents", "subjects"
  add_foreign_key "lessons", "grades"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "lop_hocs", "grades"
  add_foreign_key "lop_hocs_teachers", "lop_hocs"
  add_foreign_key "lop_hocs_teachers", "teachers"
  add_foreign_key "messes", "rooms"
  add_foreign_key "messes", "users"
  add_foreign_key "parents", "user_roles"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
  add_foreign_key "score_arrs", "students"
  add_foreign_key "score_arrs", "subjects"
  add_foreign_key "scores", "score_arrs"
  add_foreign_key "storages", "teachers"
  add_foreign_key "students", "lop_hocs"
  add_foreign_key "students", "parents"
  add_foreign_key "students", "user_roles"
  add_foreign_key "teachers", "subjects"
  add_foreign_key "user_roles", "users"
end
