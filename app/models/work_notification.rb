class WorkNotification < ApplicationRecord
  attr_accessor :near_works, :expired_works

  acts_as_notifiable :students,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(work_notification, key) {
      (:near_works)
    },
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    tracked: true

  def set_laboratory_works
    ActiveRecord::Base.connection.exec_query("
    SELECT subjects.name AS subject, laboratory_works.name AS laboratory_name, students.id AS student_id, laboratory_works.end_date AS end_date FROM subjects INNER JOIN academic_plans ON academic_plans.subject_id = subjects.id INNER JOIN laboratory_works ON laboratory_works.academic_plan_id = academic_plans.id INNER JOIN students ON students.id = laboratory_works.student_id WHERE laboratory_works.end_date - current_date <= 7 AND laboratory_works.load_date is null ORDER BY student_id, subject, laboratory_name;
    ")
  end

  def get_practical_work
    ActiveRecord::Base.connection.exec_query("
    SELECT subjects.name AS subject, practical_works.name AS practical_name, students.id AS student_id, practical_works.end_date AS end_date FROM subjects INNER JOIN academic_plans ON academic_plans.subject_id = subjects.id INNER JOIN practical_works ON practical_works.academic_plan_id = academic_plans.id INNER JOIN students ON students.id = practical_works.student_id WHERE practical_works.end_date - current_date <= 7 AND practical_works.load_date is null ORDER BY student_id, subject, practical_name;
    ")
  end
end
