Makeascene::Application.routes.draw do |map|

  
  get "photos/index"

  get "photos/destroy"

#  namespace :admin do
#    resources :events do
#      member do
#        get :preview
#      end
#      resources :photo_uploads
#      resources :photos
#    end
#  end
  
  resources :events do
    member do
      post :post_photo_to_facebook
      get :authenticate
      post :attempt_authorize
    end
  end

  match '/faq', :to => 'home#faq'
  match '/contact', :to => 'home#contact'

  root :to => "home#index"

end
