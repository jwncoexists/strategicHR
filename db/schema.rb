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

ActiveRecord::Schema.define(version: 20131205041801) do

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

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

  create_table "quizzes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
