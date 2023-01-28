Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  
  get 'pages/our-story' => 'pages#our-story'
  get 'pages/bridal-party' => 'pages#bridal-party'
  get 'pages/travel-info' => 'pages#travel-info'
  get 'pages/frequently-asked-questions' => 'pages#faq'
end
