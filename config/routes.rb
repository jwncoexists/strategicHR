StrategicHR::Application.routes.draw do

  get "welcome/index"
  get "welcome/about"
  get "welcome/pricing"
  match "pricing" => 'welcome#pricing', via: :get
  get "welcome/privacy"
  match "privacy" => 'welcome#privacy', via: :get
  root to: 'welcome#index'
  match "about" => 'welcome#about', via: :get
  resources :contact, only: [:new, :create]
  resources :events, only: [:create], via: :post
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  resources :users
  resources :email_confirmations
  resources :courses
  resources :videos
  resources :quizzes
  resources :certificates, only: [:show, :index]
  resources :attempts
  resources :results
  resources :charges
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "sessions/create"
  get "sessions/destroy"
  #match 'contact' => 'contact#new', :as => 'contact', :via => :get
  #match 'contact' => 'contact#create', :as => 'contact', :via => :post

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
