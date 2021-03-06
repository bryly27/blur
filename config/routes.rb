Rails.application.routes.draw do

  resources :profiles

  get 'sessions/index'

  get 'profiles/index'

  get 'users/index'

  root 'intros#index'

  get 'intros/index'
  get 'about' => 'intros#about'
  get 'how' => 'intros#how'
  get 'careers' => 'intros#careers'
  get 'faq' => 'intros#faq'
  get 'terms' => 'intros#terms'
  get 'home' => 'awkyos#index'
  get 'logoff' => 'sessions#destroy'
  get 'new' => 'profiles#new_photo'
  get 'new/description' => 'profiles#new_info'
  get 'awkyo/profile/edit' => 'profiles#edit'
  get 'home/search_by_state/:id' => 'awkyos#search_by_state'
  get 'home/search_by_gender/:id' => 'awkyos#search_by_gender'

  post 'users' => 'users#create'
  post 'profiles' => 'profiles#create'
  post 'login' => 'sessions#create'
  post 'profiles/update' => 'profiles#create_info'
  post 'profile/:id/update' => 'profiles#update'
  post 'home/search_by_city' => 'awkyos#search_by_city'


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
