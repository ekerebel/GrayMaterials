Rails.application.routes.draw do
  resources :accounts

  resources :grades

  resources :materials

  resources :shapes

  devise_for :users
  
  resources :listings do
    
    resources :orders, only: [:new, :create]
  end
  
  match 'listings/update_grade_select/:id', :controller=>'listings', :via => [:get], :action => 'update_grade_select'
  match 'listings/update_shape_select/:shape/:fixed_dimensions', :controller=>'listings', :via => [:get], :action => 'update_shape_select'
  match 'listings/update_shape_image/:shape/:fixed_dimensions', :controller=>'listings', :via => [:get], :action => 'update_shape_image'
  
  resources :orders
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  get 'pagesabout/contact'
  get 'listing/update_form', as: 'update_form'

  root 'listings#index'

end
