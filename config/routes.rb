Rails.application.routes.draw do

  devise_for :users, class_name: 'FormUser', :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations' }
  root 'toilets#index'
  resources :users, only: [:index, :show]
  resources :reviews
  resources :toilets, only: [:index, :show, :new, :create]
  get '/toilets/:id/review' => 'reviews#new'
  get '/toilet_data' => 'toilets#toilet_data'
  get '/filter_data' => 'toilets#index'
  post '/user_search' => 'toilets#user_search'
  resources :favorites, only: [:new]
  get 'toilets/:id/favorite' => 'favorites#new'

end
