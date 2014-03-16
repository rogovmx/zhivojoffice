ActionController::Routing::Routes.draw do |map|
  map.resources :actionitems

  map.resources :razdel1s

  map.resources :actions

  map.resources :secrets

  map.resources :vacancies

  #map.resources :collections

  map.resources :feedbacks

 # map.resources :cat1imgs

    map.resources :btg1hars

  map.resources :bcat1s

  #map.resources :victorinas

  map.resources :btg1s

  map.resources :sale_actions

  map.resources :news_items

  map.resources :cities

  map.resources :podvals

  map.resources :deskprofs

  map.resources :deskprofiles

  map.resources :desk_answs

  map.resources :desk_subjs

  map.resources :comics1s


  #map.resources :victorinas

  
  map.resources :view_needs

  map.resources :needs

  map.resources :vote1s

  map.resources :gifts
  

  map.resources :raspr2

  map.resources :mcontent1s

  map.resources :messagers

  map.resources :foo1s

  map.resources :statps

  map.resources :tag_clouds

  map.resources :zakaz_catalogs

  map.resources :coments

  map.resources :cat1s
  map.resources :user_crms
  map.resources :tov3s

  map.resources :tov2s

  #map.resources :confirms

  map.resources :lineitems

  map.resources :orders

  map.resources :adr_dosts

  map.resources :legals

  map.resources :vds

  map.resources :clients

  map.resources :carts

  map.resources :first3s

  map.resources :first2s

  map.resources :first1s

  map.resources :ists

  map.resources :bestsellers

  map.resources :cats

  map.resources :g3s

  map.resources :g2s

  map.resources :g1s

  map.resources :catalogs

  map.resources :masters

  map.resources :admins
  map.resources :users

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
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "kt1" , :action=> "index"
  # root :to=> 'kt1#index'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.

   
 
    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
    map.connect '/btg1s',:controller=>'btg1s',:action=>'index'
    map.connect '/main',:controller=>'main',:action=>'index'
    map.connect '/about',:controller=>'about',:action=>'index'
    #map.connect '/nophoto',:controller=>'nophoto',:action=>'index'
    #map.connect '/qr_registration',:controller=>'qr_registration',:action=>'index'
    map.connect '/gr/index/:id',:controller=>'catalogs',:action=>'gr'
    
    map.connect '/index.html',:controller => 'kt1', :action=>'index'
    map.connect '/',:controller => 'kt1', :action=>'index'

    map.connect "/:str",:controller=>'kt1',:action=>'index', :requirement=>{:str =>/[a-z]|\d{1,2}/},:str=>nil
    #map.connect "/:id",:controller=>'kt1',:action=>'index', :requirement=>{:id =>/\d{1,2}/ },:id=>nil
    #map.connect '/:str',:controller => 'kt1', :action=>'index',:requirements => {:str => /\d{1,2}/},:str=>nil
    

end
