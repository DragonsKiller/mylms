Teacher.create!([
  {email: "example@example.com", password: "example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-04-28 15:04:04", last_sign_in_at: "2018-04-28 15:04:04", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Igor", second_name: "Jurevich", last_name: "Pikoliuk"}
])
Group.create!([
  {name: "421701"},
  {name: "421702"},
  {name: "421703"}
])
Subgroup.create!([
  {name: "421701/1", group_id: 1},
  {name: "421702/1", group_id: 2},
  {name: "421703/1", group_id: 3},
  {name: "421701/2", group_id: 1}
])
Student.create!([
  {email: "example@example.com", password: "example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-04-28 15:03:42", last_sign_in_at: "2018-04-28 15:03:42", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", st_id: "123456", first_name: "Igor", second_name: "Jurevich", last_name: "Pikoliuk", subgroup_id: 1},
  {email: "exa@exa.com", password: "example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-04-30 18:14:04", last_sign_in_at: "2018-04-30 18:14:04", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", st_id: "1232456789", first_name: "qwqert", second_name: "qwert", last_name: "qwrt", subgroup_id: 4}
])

Semester.create!([
  {},
  {}
])
Subject.create!([
  {name: "ППВИС", description: "asdsasdasd"},
  {name: "ОТС", description: "отс"}
])
AcademicPlan.create!([
  {semester_id: 1, subject_id: 1},
  {semester_id: 1, subject_id: 2}
])
LaboratoryWork.create!([
  {name: "first", description: "test", document: "______.pdf", mark: 6, student_id: 1, academic_plan_id: 1, teacher_id: 1, end_date: "2018-04-13", load_date: "2018-04-13"},
  {name: "second", description: "test", document: "1.pdf", mark: 5, student_id: 1, academic_plan_id: 1, teacher_id: 1, end_date: "2018-04-28", load_date: "2018-04-29"},
  {name: "test3", description: "sakjdb", document: "2.pdf", mark: 9, student_id: 2, academic_plan_id: 1, teacher_id: 1, end_date: "2018-04-30", load_date: "2018-04-29"},
  {name: "test4", description: "sjdhbs", document: "______.pdf", mark: 6, student_id: 1, academic_plan_id: 2, teacher_id: 1, end_date: "2018-04-30", load_date: "2018-04-29"},
  {name: "test4", description: "kdzjxn", document: "1.pdf", mark: 7, student_id: 2, academic_plan_id: 2, teacher_id: 1, end_date: "2018-04-20", load_date: "2018-04-14"}
])
PracticalWork.create!([
  {name: "first", description: "test", document: "______.pdf", mark: 6, student_id: 1, academic_plan_id: 1, teacher_id: 1, end_date: "2018-04-30", load_date: "2018-04-28"},
  {name: "second", description: "test", document: nil, mark: 9, student_id: 1, academic_plan_id: 1, teacher_id: 1, end_date: "2018-04-20", load_date: "2018-03-21"}
])
Category.create!([
  {name: "University"},
  {name: "IIT"},
  {name: "421701"}
])
