Rails.application.routes.draw do
  get 'wiki/edit'
  get 'wiki/new'
  get 'wiki/show'
  get 'wiki/index'


  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resources :wikis

	  get 'about' => 'welcome#about'

# defaultroute:
  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
