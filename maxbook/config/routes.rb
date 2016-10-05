Rails.application.routes.draw do

  devise_for :users
  resources :people do
    resources :notes, only: [:index, :create, :destroy]
  end

  authenticated :user do
    root 'people#index', as: :authenticated_root
  end
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
