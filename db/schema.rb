# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131212060920) do

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "correct",     default: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "certificates", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.date     "purchase_date"
    t.float    "purchase_price"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "certificates", ["course_id"], name: "index_certificates_on_course_id", using: :btree
  add_index "certificates", ["user_id"], name: "index_certificates_on_user_id", using: :btree

  create_table "course_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "purchased_certificate", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_statuses", ["course_id"], name: "index_course_statuses_on_course_id", using: :btree
  add_index "course_statuses", ["user_id"], name: "index_course_statuses_on_user_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 2, default: 39.99
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ceu",                                 default: 0
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "content"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree

  create_table "quiz_attempts", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "section_id"
    t.integer  "quiz_id"
    t.integer  "num_questions"
    t.float    "passing_score"
    t.string   "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_attempts", ["course_id"], name: "index_quiz_attempts_on_course_id", using: :btree
  add_index "quiz_attempts", ["quiz_id"], name: "index_quiz_attempts_on_quiz_id", using: :btree
  add_index "quiz_attempts", ["section_id"], name: "index_quiz_attempts_on_section_id", using: :btree
  add_index "quiz_attempts", ["user_id"], name: "index_quiz_attempts_on_user_id", using: :btree

  create_table "quiz_results", force: true do |t|
    t.integer  "quiz_attempt_id"
    t.integer  "question_num"
    t.text     "question_text"
    t.integer  "answer_num"
    t.text     "answer_text"
    t.integer  "correct_answer_num"
    t.text     "correct_answer_text"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_results", ["quiz_attempt_id"], name: "index_quiz_results_on_quiz_attempt_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_questions_to_show", default: 10
    t.integer  "passing_score",         default: 70
  end

  create_table "section_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "section_id"
    t.boolean  "completed_quiz", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_statuses", ["course_id"], name: "index_section_statuses_on_course_id", using: :btree
  add_index "section_statuses", ["section_id"], name: "index_section_statuses_on_section_id", using: :btree
  add_index "section_statuses", ["user_id"], name: "index_section_statuses_on_user_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "sequence"
    t.integer  "course_id"
    t.integer  "video_id"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id", using: :btree
  add_index "sections", ["quiz_id"], name: "index_sections_on_quiz_id", using: :btree
  add_index "sections", ["video_id"], name: "index_sections_on_video_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "last_name",                    null: false
    t.string   "password_digest", default: "", null: false
    t.string   "email",           default: "", null: false
    t.string   "account"
    t.string   "slug"
    t.date     "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "first_name",      default: ""
    t.string   "title",           default: ""
    t.string   "company",         default: ""
    t.string   "address1",        default: ""
    t.string   "address2",        default: ""
    t.string   "city",            default: ""
    t.string   "state",           default: ""
    t.string   "postal_code",     default: ""
    t.string   "country",         default: ""
    t.string   "phone",           default: ""
  end

  add_index "users", ["confirmed_at"], name: "index_users_on_confirmed_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "videos", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "length"
    t.string   "presenter"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

end
