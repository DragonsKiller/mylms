class Raiting < ApplicationRecord
serialize :data
before_create :get_data
  def get_data
    self.data = ActiveRecord::Base.connection.exec_query("
      SELECT lab.semester, lab.subject, lab.tottal_lab_mark, prac.tottal_prac_mark, lab.student_id, lab.full_name FROM
      (
        SELECT DISTINCT flab.semester, flab.subject, CASE WHEN slab.labs_count > 1 THEN 1.00000 * (slab.tottal_lab_mark/slab.labs_count) ELSE 1.00000 * slab.tottal_lab_mark END AS tottal_lab_mark, flab.student_id, flab.full_name FROM
        (
          SELECT academic_plans.semester_id AS semester, subjects.name AS subject, CASE WHEN laboratory_works.load_date > laboratory_works.end_date THEN 4 ELSE laboratory_works.mark END AS lab_mark, laboratory_works.load_date AS load_date, students.id AS student_id, laboratory_works.end_date AS end_date, CONCAT(students.last_name, ' ', students.first_name, ' ', students.second_name) AS full_name FROM subjects INNER JOIN academic_plans ON academic_plans.subject_id = subjects.id INNER JOIN laboratory_works ON laboratory_works.academic_plan_id = academic_plans.id INNER JOIN students ON students.id = laboratory_works.student_id ORDER BY semester, full_name, subject
        ) AS flab
        JOIN
        (
          SELECT semester, subject, SUM(lab_mark) AS tottal_lab_mark, COUNT(*) AS labs_count, student_id, full_name
                FROM
                    (
                      SELECT academic_plans.semester_id AS semester, subjects.name AS subject, CASE WHEN laboratory_works.load_date > laboratory_works.end_date THEN 4 ELSE laboratory_works.mark END AS lab_mark, laboratory_works.load_date AS load_date, laboratory_works.end_date AS end_date, students.id AS student_id, CONCAT(students.last_name, ' ', students.first_name, ' ', students.second_name) AS full_name FROM subjects INNER JOIN academic_plans ON academic_plans.subject_id = subjects.id INNER JOIN laboratory_works ON laboratory_works.academic_plan_id = academic_plans.id INNER JOIN students ON students.id = laboratory_works.student_id ORDER BY semester, full_name, subject
                    ) AS sslab GROUP BY sslab.semester, sslab.subject, sslab.student_id, sslab.full_name HAVING COUNT(*) > 0
        ) AS slab ON flab.semester = slab.semester AND flab.subject = slab.subject AND flab.student_id = slab.student_id AND flab.full_name = slab.full_name
      ) AS lab
      FULL OUTER JOIN
      (
        SELECT DISTINCT fprac.semester, fprac.subject, CASE WHEN sprac.pracs_count > 1 THEN 1.00000 * (sprac.tottal_prac_mark/sprac.pracs_count) ELSE 1.00000 * sprac.tottal_prac_mark END AS tottal_prac_mark, fprac.student_id, fprac.full_name FROM
        (
          SELECT academic_plans.semester_id AS semester, subjects.name AS subject, CASE WHEN practical_works.load_date > practical_works.end_date THEN 4 ELSE practical_works.mark END AS prac_mark, practical_works.load_date AS load_date, practical_works.end_date AS end_date, students.id AS student_id, CONCAT(students.last_name, ' ', students.first_name, ' ', students.second_name) AS full_name FROM subjects INNER JOIN academic_plans ON academic_plans.subject_id = subjects.id INNER JOIN practical_works ON practical_works.academic_plan_id = academic_plans.id INNER JOIN students ON students.id = practical_works.student_id ORDER BY semester, full_name, subject
        ) AS fprac
        JOIN
        (
          SELECT semester, subject, SUM(prac_mark) AS tottal_prac_mark, COUNT(*) AS pracs_count, student_id, full_name
                FROM
                    (
                      SELECT academic_plans.semester_id AS semester, subjects.name AS subject, CASE WHEN practical_works.load_date > practical_works.end_date THEN 4 ELSE practical_works.mark END AS prac_mark, practical_works.load_date AS load_date, practical_works.end_date AS end_date, students.id AS student_id, CONCAT(students.last_name, ' ', students.first_name, ' ', students.second_name) AS full_name FROM subjects INNER JOIN academic_plans ON academic_plans.subject_id = subjects.id INNER JOIN practical_works ON practical_works.academic_plan_id = academic_plans.id INNER JOIN students ON students.id = practical_works.student_id ORDER BY semester, full_name, subject
                    ) AS ssprac GROUP BY ssprac.semester, ssprac.subject, ssprac.student_id, ssprac.full_name HAVING COUNT(*) > 0
        ) AS sprac ON fprac.semester = sprac.semester AND fprac.subject = sprac.subject AND fprac.student_id = sprac.student_id AND fprac.full_name = sprac.full_name
      ) AS prac ON lab.semester = prac.semester AND lab.subject = prac.subject AND lab.student_id = prac.student_id AND lab.full_name = prac.full_name ORDER BY  lab.semester, lab.full_name, lab.subject;
    ")
  end

  def get_students_groups
    ActiveRecord::Base.connection.exec_query("
      SELECT groups.name AS group_name, students.id AS student_id, CONCAT(students.last_name, ' ', students.first_name, ' ', students.second_name) AS full_name FROM groups INNER JOIN subgroups ON subgroups.group_id = groups.id INNER JOIN students ON students.subgroup_id = subgroups.id ORDER BY group_name, full_name;
    ")
  end
end
