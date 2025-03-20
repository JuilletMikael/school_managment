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

  # Dean specific routes
  namespace :dean do
    resources :courses do
      member do
        get 'assign_teacher'
        post 'update_teacher'
      end
    end
    resources :classrooms do
      member do
        get 'assign_students'
        patch 'assign_students'
      end
    end
    resources :examinations
    resources :grades do
      collection do
        get 'generate_score_sheet'
      end
    end
  end

  # Teacher specific routes
  namespace :teacher do
    resources :courses, only: [:index, :show] do
      resources :examinations
      resources :grades
    end
  end

  # Student specific routes
  namespace :student do
    resources :courses, only: [:index, :show]
    resources :examinations, only: [:index, :show]
    resources :grades, only: [:index, :show] do
      member do
        get 'score_sheet'
      end
    end
  end

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
