Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'toilets#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :reviews
  resources :toilets, only: [:index, :show, :new, :create]
  get '/toilets/:id/review' => 'reviews#new'
  get '/toilet_data' => 'toilets#toilet_data'
  get '/filter_data' => 'toilets#index'
  post '/user_search' => 'toilets#user_search'
  resources :favorites, only: [:new]
  get 'toilets/:id/favorite' => 'favorites#new'

end
