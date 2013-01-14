Winspector::Application.routes.draw do
  get "folders/create"
  post "folders/detail_upload"
  post "folders/change_name"
  post "folders/all_move"

  post "relation/index"
  post "relation/create"
  get "relation/edit"

  get "questionnaire/index"
  post "questionnaire/new"
  get "questionnaire/edit"
  get "questionnaire/vote"

  post "photoframe/get_contents"
  post "photoframe/photohome"
  post "photoframe/upload_p"
  post "photoframe/folder"
  get "photoframe/photohome"
  get "photoframe/slideshow_all"
  get "photoframe/get_contents"
  get "photoframe/get_folder_thumb"
  get "photoframe/detail"
  get "photoframe/detail_upload_done"

  get "portal/index"
  post "portal/tweet"
  post "portal/gettweet"
  post "portal/relations"
  post "portal/prerelations"

  resources :users

  resources :folders do
    resources :photos
  end
  resources :photos

  get "top/index"
  post "top/login"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
