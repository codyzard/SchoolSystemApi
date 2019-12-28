Rails.application.routes.draw do
  
  devise_for :users, controllers: { 
    :sessions => 'users/sessions',
    :registrations => 'users/registrations' 
  }
  resources :announces
  resources :documents
  resources :grades
  resources :lessons
  resources :lop_hocs do 
    member do
      # get 'all_student_info'
      get 'all_student_score'
    end
  end
  resources :messes
  post '/getMessInRoom', to: 'messes#getMessInRoom'
  get '/getSendPerson/:user_token', to: 'messes#getSendPerson'
  resources :parents
  # resources :rooms
  # get '/rooms/:authentication_token', to: 'rooms#index'
  post '/rooms/getRoom', to: 'rooms#getRoom'
  resources :score_arrs
  resources :scores
  resources :storages
  resources :students do
    member do
      get 'student_detail'
    end
  end
  resources :subjects
  resources :teachers do
    member do
      get 'lop_hocs'
    end
  end
  resources :user_roles
  get '/users/:authentication_token', to: 'users#show'
  put '/users/:authentication_token', to: 'users#update'
  #profile
  post 'users/getProfile', to: "users#getProfile"
  #classes by teacher
  post '/lop_hocs_every_teacher', to: 'lop_hocs#getAllClassEveryTeacher'
  post '/students_in_lophoc', to: 'lop_hocs#all_student_info'
  post '/students_score_in_lophoc', to: 'lop_hocs#all_student_score'
  post '/update_student_score', to: 'score_arrs#update_student_score'
  post '/create_group_class_chat', to: 'rooms#create_group_class_chat'
  mount ActionCable.server => '/rooms'
  
end
