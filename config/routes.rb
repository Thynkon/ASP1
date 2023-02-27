Rails.application.routes.draw do
  devise_for :people do
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
  end
  resources :courses
  resources :quarters
  resources :semesters
  resources :evaluations
  resources :exams
  resources :cities
  resources :promotions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
