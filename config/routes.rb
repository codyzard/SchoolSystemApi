Rails.application.routes.draw do
  devise_for :users
  resources :announces
  resources :documents
  resources :grades
  resources :lessons
  resources :list_rooms
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

end
