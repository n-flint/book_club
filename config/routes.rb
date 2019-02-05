Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  #what does shallow: true do?
  resources :books, shallow: true, except: [:update, :edit] do
    resources :reviews, only: [:create, :new, :destroy]
    resources :authors, only: :show
  end
  resources :users, only: :show
end
