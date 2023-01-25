Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  
  get 'pages/our-story' => 'pages#construction'
  get 'pages/bridal-party' => 'pages#construction'
  get 'pages/travel-info' => 'pages#construction'
  get 'pages/frequently-asked-questions' => 'pages#construction'
end
