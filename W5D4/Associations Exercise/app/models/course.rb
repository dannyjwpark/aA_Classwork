# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    has_many(:course_enrollments,{
        primary_key: :id,
        foreign_key: :course_id,
        class_name: "Enrollment"
    })

    has_many(:enrolled_students,{
        through: :course_enrollments,
        source: :student
    })

    belongs_to(:prerequisite, {
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: "Course"
    })

    belongs_to(:instructor, {
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: "User"
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
