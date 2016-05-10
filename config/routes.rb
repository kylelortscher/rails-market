Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  #RESTFUL ROUTES FOR SERVICE
  #Show All Services
  get '/services', to: 'services#index'
  root 'services#index'
  #Form For New Service
  get '/services/new', to: 'services#new'
  #Create New Service
  post '/services', to: 'services#create'
  #Getting Service
  get '/services/:algolia_id/:title_seo', to: 'services#show'
  #Getting Edit Service
  get '/services/:id/edit', to: 'services#edit'
  #Chaning The Service
  put '/services/:id', to: 'services#update'
  #Delete A Service
  #delete 'services/:id', to: 'services#destroy'


  #Current User Profile
  get '/profile', to: 'profiles#index'
  #Other Users Profile
  get '/profile/:username', to: 'profiles#show'





  # You can have the root of your site routed with "root"



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
