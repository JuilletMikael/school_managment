Rails.application.routes.draw do
  # Root path based on user role
  devise_for :people
  
  # Authenticated users are redirected to dashboard
  authenticated :person do
    get "/", to: "dashboard#index", as: :authenticated_root
  end
  
  # Non-authenticated users are redirected to home page
  root "home#index"

  # Profile route
  get 'profile', to: 'profiles#show', as: :profile

  # Dashboard routes
  get 'dashboard', to: 'dashboard#index'

  # Resources with role-based access
  resources :courses do
    resources :examinations
    resources :grades
  end

  resources :classrooms do
    resources :students
  end

  resources :teachers
  resources :students do
    resources :grades, only: [:index]
  end
  resources :deans

  # General resources
  resources :subjects
  resources :rooms
  resources :people
  resources :person_statuses
  resources :addresses

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
end
