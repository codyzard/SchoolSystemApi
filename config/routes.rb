Rails.application.routes.draw do
  
  devise_for :users, controllers: { 
    :sessions => 'users/sessions',
    :registrations => 'users/registrations' 
  }
  # resources :announces
  # resources :documents
  # resources :grades
  # resources :lessons
  # resources :list_rooms
  resources :lop_hocs
  # resources :messes
  # resources :parents
  # resources :rooms
  # resources :score_arrs
  # resources :scores
  # resources :storages
  resources :students do
    member do
      get 'student_detail'
    end
  end

  # resources :subjects
  resources :teachers do
    member do
      get 'lop_hocs'
    end
  end
  # resources :user_roles
  get '/users/:authentication_token', to: 'users#show'
  #Dang
end
