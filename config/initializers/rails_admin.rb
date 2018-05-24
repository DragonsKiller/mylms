RailsAdmin.config do |config|

  config.main_app_name = ["Подсистема управления обучением", '']

  config.model 'Student' do
    list do
      field :last_name
      field :first_name
      field :second_name
      field :st_id
      field :email
      field :subgroup
    end

    edit do
      field :last_name
      field :first_name
      field :second_name
      field :st_id
      field :email
      field :subgroup
      field :password
      field :password_confirmation
    end
  end

  config.model 'Teacher' do
    list do
      field :last_name
      field :first_name
      field :second_name
      field :email
    end

    edit do
      field :last_name
      field :first_name
      field :second_name
      field :email
      field :password
      field :password_confirmation
    end
  end

  config.model 'Admin' do
    list do
      field :login
      field :email
    end

    edit do
      field :login
      field :email
      field :password
      field :password_confirmation
    end
  end

  config.model 'Campus' do
    list do
      field :id
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :classrooms
    end
  end

  config.model 'Category' do
    list do
      field :name
    end

    edit do
      field :name
    end
  end

  config.model 'Classroom' do
    list do
      field :number
      field :campus
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :lessons
    end
  end

  config.model 'Lesson' do
    list do
      field :lesson_type
      field :lesson_date
      field :subject
      field :teacher
      field :classroom
    end
  end

  config.model 'ClassesTimetables' do
    list do
      field :semester
      field :subgroup
      field :lesson
    end

    edit do
      field :semester
      field :subgroup
    end
  end


  config.model 'Post' do
    list do
      field :title
      field :category
    end
  end

  config.model 'Group' do
    list do
      field :name
      field :subgroups
    end

    edit do
      field :name
    end
  end

  config.model 'Semester' do
    list do
      field :id
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :academic_plans, :subjects, :classes_timetables
    end
  end

  config.model 'Subgroup' do
    list do
      field :name
      field :group
      field :students
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :classes_timetables
    end
  end

  config.model 'StudentsProjectMembership' do
    list do
      field :student
      field :project
    end
  end

  config.model 'TeachersProjectMembership' do
    list do
      field :teacher
      field :project
    end
  end

  config.model 'LaboratoryWork' do
    list do
      field :academic_plan
      field :name
      field :mark
      field :student
      field :teacher
      field :load_date
      field :end_date
    end
  end

  config.model 'PracticalWork' do
    list do
      field :academic_plan
      field :name
      field :mark
      field :student
      field :teacher
      field :load_date
      field :end_date
    end
  end

  config.model 'Subject' do
    list do
      field :name
      field :semesters
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :academic_plans
    end
  end

  config.model 'Raiting' do
    list do
      field :id
      field :created_at
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :data
    end
  end

  config.model 'AcademicPlan' do
    list do
      field :semester
      field :subject
      field :laboratory_works
      field :practical_works
    end

    edit do
      field :semester
      field :subject
    end
  end

  config.model 'Project' do
    list do
      field :name
      field :project_admin do
        def value
          Teacher.find(bindings[:object].project_admin_id).name
        end
      end
      field :students_project_memberships
      field :teachers_project_memberships
    end

    edit do
      field :name
      field :project_admin_id
      field :students
      field :teachers
    end
  end

  config.model BrigadeMembership do
     visible false
  end

  config.model WorkNotification do
     visible false
  end

  config.model Message do
     visible false
  end

  config.model ChatRoom do
     visible false
  end

  config.model Brigade do
     visible false
  end

  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['LaboratoryWork', 'PracticalWork', 'Raiting', 'StudentsProjectMembership']
    end
    export
    bulk_delete
    show
    edit do
      except ['LaboratoryWork', 'PracticalWork', 'Raiting', 'StudentsProjectMembership']
    end
    delete do
      except ['LaboratoryWork', 'PracticalWork', 'Raiting', 'StudentsProjectMembership']
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
