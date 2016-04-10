Rails.application.routes.draw do

<<<<<<< HEAD
<<<<<<< HEAD
  root 'welcome#index'

  get 'user/new'
  get 'users/new'
  
  resources :toilets
=======
=======
  root 'toilets#index'
>>>>>>> 8e4f86e... Map of toilets is homepage
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 254a0af... Add working pins for map
=======
  resources :favorites, only: [:new]
  get 'toilets/:id/favorite' => 'favorites#new'
>>>>>>> 1d2b502... Made tags table, working on filters for map
=======
  get '/user_search' => 'toilets#user_search'
=======
  post '/user_search' => 'toilets#user_search'
>>>>>>> ead5dc4... Add user_search route to capture user input on homepage search box
  resources :favorites, only: [:new]
  get 'toilets/:id/favorite' => 'favorites#new'

>>>>>>> 3803099... Add search box on homepage for users to revise map are
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
