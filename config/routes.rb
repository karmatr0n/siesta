ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'sessions'
  map.resource  :session
  map.resource  :user, :member => { :confirm => :get, :recovery_passwd_request => :get, :confirm => :get, :recovery_passwd => :post }
  map.resource  :person
  map.resource  :address
  map.resources :schoolings, :collection => { :list => :get}
  map.resources :user_documents
  map.resources :user_requests
  map.resources :send_user_requests, :member => { :send_request => :get }
  map.resource  :change_password
  map.resources  :photos

  map.namespace :academic do |academic|
      academic.resource  :session
      academic.resources :user_requests, :member => { :authorize => :get, :unauthorize => :get }
#      academic.resources  :photos
  end

  map.namespace :department do |department|
      department.resource  :session
      department.resources :user_requests, :collection => { :search => :get}
  end

  map.namespace :admin do |admin|
    admin.resource :session
    admin.resource :card, :member => { :front => :get, :back => :get }
    admin.resources :photos
    admin.resources :user_requests
    admin.resources :users
  end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
