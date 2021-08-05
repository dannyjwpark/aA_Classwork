# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
    # belongs to : Course
#  student_id :integer
    # belongs to : user
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    belongs_to(:course, {
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course
    })

    belongs_to(:student, {
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User
    })


end





# create_table "courses", force: :cascade do |t|
#     t.string "name"
#     t.integer "prereq_id"
#     t.integer "instructor_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "enrollments", force: :cascade do |t|
#     t.integer "course_id"
#     t.integer "student_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
