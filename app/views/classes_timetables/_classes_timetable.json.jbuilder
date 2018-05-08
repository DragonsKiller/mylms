json.extract! classes_timetable, :id, :semester_id, :subgroup_id, :created_at, :updated_at
json.url classes_timetable_url(classes_timetable, format: :json)
