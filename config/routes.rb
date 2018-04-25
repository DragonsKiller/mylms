Rails.application.routes.draw do
  resources :practical_works
  resources :laboratory_works
  resources :subjects
  devise_for :admins
  devise_for :teachers
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts
end
