Tenkuai::Application.routes.draw do
  resources :mailboxes

  resources :orders

  devise_for :users, :path_names => { :sign_up => "join", :sign_in => "login"}
  resources :categories, :shirs, :roles
  #link the shirs with the users and only display the view show
  resources :users, :only=>[:show] do
    resources :mailboxes
    resources :shirs
  end
 
 #  hide the controllers name
  get "/:user_id/:id", :to => "shirs#show", :as => :shirs_user
  get "/:user_id/mailbox/new", :to => "mailboxes#new", :as => :mailbox_user
  
  resources :shirs do
    resources :orders
  end
  
  
  get "home/index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #  match 'user/:id' => 'users#show'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  match ':id' => "users#show", :as => :username
  match '*a', :to => 'errors#routing'
  #match '/:username' => 'users#show'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
