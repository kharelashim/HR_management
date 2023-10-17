Rails.application.routes.draw do
  devise_for :users
  resources :employees
  resources :leave_requests
  resources :attendences
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "employees#index"
  post 'update_status' => 'leave_requests#update_status'

  
end
