Rails.application.routes.draw do
  resources :castes
  resources :attachments
  resources :graves
  resources :relationships
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  root 'home#index'

end
