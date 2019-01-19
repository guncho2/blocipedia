Rails.application.routes.draw do

  # get 'charges/create'
  # get 'charges/new'
  # get 'charges/downgrade'

  # get 'wikis/edit'
  # get 'wikis/new'
  # get 'wikis/show'
  # get 'wikis/index'


  devise_for :users
  get 'welcome/index'
  get 'welcome/about'


  resources :wikis

	  get 'about' => 'welcome#about'

# defaultroute:
  root 'welcome#index'

 resources :charges, only: [:new, :create]
 get 'downgrade' => 'charges#downgrade'
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
