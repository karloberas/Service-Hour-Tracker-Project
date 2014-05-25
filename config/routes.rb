Rails.application.routes.draw do

  root to: "pages#index"

  get '/about', to: 'pages#about', as: :about

  get '/top5', to: 'pages#top5', as: :top5

  resources :dorm_assistants

  resources :service_hours


end
