Rails.application.routes.draw do
  
  devise_for :users, controllers: { 
    :sessions => 'users/sessions',
    :registrations => 'users/registrations' 
  }
  resources :announces
  resources :documents
  resources :grades
  resources :lessons
  resources :lop_hocs
  resources :messes
  resources :parents
  resources :rooms
  resources :score_arrs
  resources :scores
  resources :storages
  resources :students
  resources :subjects
  resources :teachers
  resources :user_roles
  get '/users/:authentication_token', to: 'users#show'
  put '/users/:authentication_token', to: 'users#update'
end
