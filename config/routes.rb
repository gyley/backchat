Rails.application.routes.draw do

  get 'submission/show'

  get 'submission/submit'

  get 'output_job/edit'

  get 'output_job/show'

  get 'output_job/new'

  get 'output/edit'

  get 'output/show'

  get 'output/new'

  get 'form/edit'

  get 'form/show'

  get 'form/new'

  # =======================
  # GENERAL
  # =======================

   # You can have the root of your site routed with "root"
  root 'shared#index'

  # Send support form data
  #match '/send_support_request' => 'shared#send_support_request', via: [:post]

  # =======================
  # USERS
  # =======================

  # User Authentication
  devise_for :users, :controllers => {omniauth_callbacks: 'omniauth_callbacks'}

  # After signup request extra user details
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :users, except: [:show, :new, :create] do
    collection do
      match "/dashboard", to: "users#index", via: [:get, :post]
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # =======================
  # UNUSED DEFAULTS
  # =======================

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
