Rails.application.routes.draw do
  resources :pages
  root 'pages#index', as: :home_index
  delete '/pages/:id', to: 'pages#destroy', as: :destroy_empresa
  patch '/pages/:id', to: 'pages#update', as: :update_empresa
  get '/pages/:id/edit', to: 'pages#edit', as: :edit_empresa
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'user_sessions/new', to: 'user_sessions#new', as: :login
  resources :users, only: [:index, :new, :create]
  get 'home/index', to: 'home#index', as: :home
  get 'users/new', to: 'users#create', as: :user_register
  get 'pages/export_csv/:id', to: 'pages#export_csv', as: 'export_csv'
  get 'pages/export_pdf/:id', to: 'pages#export_pdf', as: 'export_pdf'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
