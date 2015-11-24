Rails.application.routes.draw do
  # get 'reservations/index'

  # get 'reservations/new'

  # get 'reservations/create'

  # get 'reservations/destroy'

  root 'main#index'
  get 'about' => 'main#about'
  get 'howitworks' => 'main#howitworks'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'profile/:id' => 'users#show', :as => :user
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  post 'results/:id' => 'results#create'

  resources :results do
    resources :chargnes
  end
  resources :properties
  resources :reservations
  
  match '*a', :to => 'errors#routing', via: :get
  get "/422", :to => 'errors#unacceptable'
  get "/500", :to => 'errors#internal_error'
  
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
