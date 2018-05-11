Rails.application.routes.draw do
  root 'posts#index'
  resources :subjects, only: [:insex, :show]
  resources :posts
  resources :raitings, only: %i[index]
  resources :groups, only: [:index, :show]
  resources :groups do
    resources :subgroups, only: [:index, :show]
  end

  devise_for :admins
  devise_for :teachers
  devise_for :students

  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  authenticate :student do
    resources :laboratory_works, only: [:show, :edit, :update]
    resources :practical_works, only: [:show, :edit, :update]
    resources :classes_timetables, only: [:index,:show]
    resources :brigades
    resources :brigade_memberships
  end

  authenticate :teacher do
    resources :laboratory_works
    resources :practical_works
    resources :academic_plans, only: [:index, :show, :edit, :update]
    resources :classes_timetables, only: [:index, :show, :edit, :update]
    resources :teachers_project_memberships
    resources :students_project_memberships
    resources :projects
    resources :lessons
  end

  authenticate :admin do
    resources :laboratory_works
    resources :practical_works
    resources :academic_plans
    resources :classes_timetables
    resources :brigades
    resources :brigade_memberships
    resources :teachers_project_memberships
    resources :students_project_memberships
    resources :projects
    resources :semesters
    resources :campus
    resources :classrooms
    resources :groups
    resources :groups do
      resources :subgroups
    end
    resources :subjects
  end

end
