Rails.application.routes.draw do

  resources :chests
  resources :monsters
  resources :recipes
  resources :items
  resources :rooms
  resources :donjons
  resources :avatars
  resources :quests

	root 'index#index'
  	devise_for :users
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'town'                    => 'index#town'
  get 'finishDonjon'            => 'avatars#finishDonjon'
  get 'addItemById'             => 'avatars#addItemById'
  get 'majAvatar'               => 'avatars#majAvatar'
  get 'gameover'                => 'index#gameover'
  get 'addGold'                 => 'avatars#addGold'
  get 'sitItem'                 => 'avatars#sitItem'
  get 'unsitItem'               => 'avatars#unsitItem'
  get 'craft'                   => 'avatars#craft'
  get 'heal'                    => 'avatars#heal'
  get 'rest'                    => 'avatars#rest'
  get 'getForge'                => 'items#getForge'
  get 'buy'                     => 'items#buy'
  get 'sale'                    => 'items#sale'
  get 'startQuest'              => 'quests#startQuest'
  get 'CompletQuest'            => 'quests#completQuest'
end
