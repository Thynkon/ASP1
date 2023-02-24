Rails.application.routes.draw do
  resources :courses
  resources :quarters
  resources :semesters
  resources :evaluations
  resources :exams
  resources :cities
  resources :promotions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
