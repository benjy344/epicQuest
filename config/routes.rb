Rails.application.routes.draw do

  resources :chests
  resources :monsters
  resources :recipes
  resources :items
  resources :rooms
  resources :donjons
  resources :avatars

	root 'index#index'
  	devise_for :users
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
