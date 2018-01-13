Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#index'

  get 'static_pages/index'

  get 'static_pages/help'

  get 'static_pages/about'

  resources :categories do
    resources :items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
