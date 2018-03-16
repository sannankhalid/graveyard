Rails.application.routes.draw do
  resources :identities
  resources :castes
  resources :attachments
  resources :graves
  resources :relationships
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  resources :home do
    collection do
      post :search_form
      get :search
    end
    post :search_form
    get :search
  end

  get "graves_data" => "home#graves_data" , as: :get_graves
  get "caste_data" => "home#caste_data" , as: :get_caste
  get "identity_data" => "home#identity" , as: :get_identity
  root 'home#index'

end
