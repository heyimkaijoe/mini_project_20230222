Rails.application.routes.draw do
  devise_for :users

  resources :short_urls
  get '/search', to: 'short_urls#redirect'
  get '/visit_histories', to: 'short_urls#check_visit_histories'

  resources :visit_histories, only: %i[ create ]

  root 'short_urls#index'
end
