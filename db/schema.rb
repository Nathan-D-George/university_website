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

ActiveRecord::Schema[7.0].define(version: 2023_07_26_075358) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assessments", force: :cascade do |t|
    t.string "name"
    t.integer "assess_type", default: 0
    t.integer "mark", default: 10
    t.integer "total", default: 10
    t.integer "subject_id", null: false
    t.index ["subject_id"], name: "index_assessments_on_subject_id"
  end

  create_table "bags", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.integer "qualification_id", null: false
    t.index ["qualification_id"], name: "index_bags_on_qualification_id"
    t.index ["user_id"], name: "index_bags_on_user_id"
  end

  create_table "enlistments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "subject_id", null: false
    t.index ["subject_id"], name: "index_enlistments_on_subject_id"
    t.index ["user_id"], name: "index_enlistments_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name", default: "Lesson #"
    t.integer "subject_id", null: false
    t.text "description", default: "Subject's description"
    t.boolean "visible", default: false
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
  end

  create_table "marksboards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "assessment_id", null: false
    t.index ["assessment_id"], name: "index_marksboards_on_assessment_id"
    t.index ["user_id"], name: "index_marksboards_on_user_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "qualification_id", null: false
    t.string "name"
    t.index ["qualification_id"], name: "index_packages_on_qualification_id"
    t.index ["subject_id"], name: "index_packages_on_subject_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "name"
    t.integer "credits_total"
    t.integer "credits_completed", default: 0
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.integer "credits", default: 16
    t.boolean "completed", default: false
    t.integer "mark"
    t.integer "year", default: 1
    t.integer "semester", default: 1
  end

  create_table "users", force: :cascade do |t|
    t.integer "student_no", default: 2023000000
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.boolean "residence", default: false
    t.integer "year_of_study", default: 1
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assessments", "subjects"
  add_foreign_key "bags", "qualifications"
  add_foreign_key "bags", "users"
  add_foreign_key "enlistments", "subjects"
  add_foreign_key "enlistments", "users"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "marksboards", "assessments"
  add_foreign_key "marksboards", "users"
  add_foreign_key "packages", "qualifications"
  add_foreign_key "packages", "subjects"
end
