json.extract! lesson, :id, :type, :lesson_date, :lesson_time, :classes_timetable_id, :subject_id, :teacher_id, :classroom_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
