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
  get '/getMessInRoom/:room_id', to: 'messes#getMessInRoom'
  get '/getSendPerson/:user_token', to: 'messes#getSendPerson'
  resources :parents
  # resources :rooms
  get '/rooms/:authentication_token', to: 'rooms#index'
  resources :score_arrs
  resources :scores
  resources :storages
  resources :students
  resources :subjects
  resources :teachers
  resources :user_roles
  get '/users/:authentication_token', to: 'users#show'
  put '/users/:authentication_token', to: 'users#update'
  mount ActionCable.server => '/rooms'
end
