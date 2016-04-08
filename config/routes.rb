Rails.application.routes.draw do

<<<<<<< HEAD
  root 'welcome#index'

  get 'user/new'
  get 'users/new'
  
  resources :toilets
=======
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
<<<<<<< HEAD
  get 'toilets/index'

  resources :users
>>>>>>> e938c9b... Add user authentication with nav bar options
=======
  resources :users
  resources :reviews
<<<<<<< HEAD
  resources :toilets
  resources :favorites
  get '/toilets/:id/review' => 'reviews#new'
<<<<<<< HEAD
>>>>>>> 8c5549a... Finish adding reviews to toilet show page, needs error handling still
=======
  get 'toilets/:id/favorite' => 'favorites#new'
>>>>>>> 48019f4... Made validations for favorites, set up seed file for favorites
=======
  resources :toilets, only: [:index, :show]
  get '/toilets/:id/review' => 'reviews#new'

  get '/toilet_data' => 'toilets#toilet_data'
>>>>>>> 254a0af... Add working pins for map
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
