Rails.application.routes.draw do
  namespace :admin do
      resources :teacher_teaches_courses
      resources :student_participates_in_semesters
      resources :student_belongs_to_promotions
      resources :semesters
      resources :roles
      resources :quarters
      resources :promotions
      resources :person_has_roles
      resources :exams
      resources :evaluations
      resources :courses
      resources :cities
      resources :categories
      resources :people
      resources :teachers
      resources :students

      root to: "teacher_teaches_courses#index"
    end
  devise_for :people do
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
  end
  resources :courses do
    resources :exams, only: [:new, :create]
  end
  resources :quarters
  resources :semesters
  resources :exams, only: [:index, :show, :edit, :destroy] do
    resources :evaluations, only: [:new, :create]
  end
  resources :evaluations, only: [:show, :edit, :destroy]
  resources :cities
  resources :promotions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
