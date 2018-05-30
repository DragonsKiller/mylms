Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  root 'posts#index'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  resources :subjects, only: [:index, :show]
  resources :posts, only: [:index,  :show]
  resources :classes_timetables, only: [:index] do
    resources :lessons, only: [:index, :show]
  end
  resources :raitings, only: %i[index]
  resources :groups, only: [:index, :show] do
    resources :subgroups, only: [:index, :show]
  end

  devise_for :admins
  devise_for :teachers
  devise_for :students

  authenticate :student do
    resources :brigades do
      resources :brigade_memberships
    end
  end

  resources :student do
    resources :laboratory_works, only: [:index, :show, :edit, :update]
    resources :practical_works, only: [:index, :show, :edit, :update]
  end



  resources :teacher do
    resources :laboratory_works, :practical_works, :projects
    resources :lessons
  end

  authenticate :teacher do
    resources :projects, only: [:index, :show] do
      resources :teachers_project_memberships, :students_project_memberships
    end
    resources :chat_rooms, only: [:new, :create, :show, :index]
    resources :lessons, only: [:new, :create, :edit, :update, :destroy]
  end

  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  mount RailsAdmin::Engine => '/adminka', as: 'rails_admin'


end
