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

ActiveRecord::Schema.define(version: 20150715134844) do

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alu_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "answers", force: true do |t|
    t.integer  "number"
    t.integer  "timeleft"
    t.datetime "responsetime"
    t.float    "pointsBefore"
    t.integer  "question_id"
    t.integer  "test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  create_table "chat_message_keywords", force: true do |t|
    t.integer  "chat_message_id"
    t.integer  "question_id"
    t.string   "keyword"
    t.string   "previous"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chat_message_keywords", ["chat_message_id"], name: "index_chat_message_keywords_on_chat_message_id", using: :btree
  add_index "chat_message_keywords", ["question_id"], name: "index_chat_message_keywords_on_question_id", using: :btree

  create_table "chat_messages", force: true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.text     "body"
    t.integer  "msgtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competence_groups", force: true do |t|
    t.string   "filename"
    t.integer  "competence_id"
    t.integer  "alu_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "points"
  end

  create_table "competence_nodes", force: true do |t|
    t.integer  "node_id"
    t.integer  "competence_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edges", id: false, force: true do |t|
    t.integer  "id",         default: "nextval('edges_id_seq'::regclass)", null: false
    t.integer  "src_id"
    t.integer  "dest_id"
    t.float    "dep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouptest_chatmessages", force: true do |t|
    t.integer  "test_id"
    t.integer  "chat_message_id"
    t.integer  "qnumber"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "comment"
  end

  create_table "grouptest_students", force: true do |t|
    t.integer  "test_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "node_question_relations", force: true do |t|
    t.integer  "node_id"
    t.integer  "question_id"
    t.float    "dep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.text     "content"
    t.float    "minPassPoints"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.string   "keywords"
  end

  create_table "proposed_keywords", force: true do |t|
    t.integer  "question_id"
    t.integer  "count"
    t.integer  "state"
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposed_keywords", ["question_id"], name: "index_proposed_keywords_on_question_id", using: :btree

  create_table "question_responses", force: true do |t|
    t.text     "response"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "content"
    t.integer  "answerTime"
    t.integer  "correctAnswer"
    t.float    "difficulty"
    t.float    "luck"
    t.string   "img"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keywords"
    t.integer  "teacher_id"
  end

  create_table "related_contents", force: true do |t|
    t.string   "filename"
    t.boolean  "recover"
    t.text     "description"
    t.integer  "node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "session_chatmessages", force: true do |t|
    t.integer  "chat_message_id"
    t.string   "sessionid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "stopwords", force: true do |t|
    t.string   "word"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stopwords", ["word"], name: "index_stopwords_on_word", using: :btree

  create_table "student_alu_groups", force: true do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "alu_group_id"
    t.integer  "student_id"
  end

  create_table "student_assigns", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "lastcheck"
  end

  create_table "teacher_assigns", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "coordinator"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_alu_msgqualifs", force: true do |t|
    t.integer  "test_id"
    t.integer  "grade1"
    t.integer  "grade2"
    t.integer  "grade3"
    t.integer  "grade4"
    t.integer  "grade_total"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_alu_msgqualifs", ["student_id"], name: "index_test_alu_msgqualifs_on_student_id", using: :btree
  add_index "test_alu_msgqualifs", ["test_id"], name: "index_test_alu_msgqualifs_on_test_id", using: :btree

  create_table "tests", force: true do |t|
    t.boolean  "finished"
    t.float    "points"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_salt"
    t.string   "password_hash"
    t.string   "email"
    t.string   "name"
    t.boolean  "active"
    t.integer  "useraccount_id"
    t.string   "useraccount_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewed_test_questions", force: true do |t|
    t.integer  "test_id"
    t.integer  "qnumber"
    t.integer  "student_id"
    t.integer  "ntimes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: true do |t|
    t.integer  "node_id"
    t.float    "initialpoints"
    t.integer  "worktype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assignedto_type"
    t.integer  "assignedto_id"
  end

end
