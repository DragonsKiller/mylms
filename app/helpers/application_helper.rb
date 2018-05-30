module ApplicationHelper
  def gravatar_for(student, opts = {})
    opts[:alt] = student.name
  end
end
