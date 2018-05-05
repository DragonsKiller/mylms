Rails.application.routes.draw do
  resources :academic_plans
  resources :semesters
  resources :teachers_project_memberships
  resources :students_project_memberships
  resources :projects
  resources :brigade_memberships
  resources :brigades
  root 'posts#index'
  get "groups/:group/new_subgroup", :to => "groups#new_subgroup"
  post "groups/:group/new_subgroup", :to => "groups#new_subgroup"

  resources :groups do
    resources :subgroups
  end
  resources :groups
  resources :practical_works
  resources :laboratory_works
  resources :subjects
  devise_for :admins
  devise_for :teachers
  devise_for :students
  resources :raitings, only: %i[index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  resources :posts
end
