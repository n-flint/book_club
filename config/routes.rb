Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #what does shallow: true do?
  resources :books, shallow: true, only: [:index, :show, :new] do
    resources :reviews, only: [:create, :new]
    resources :authors, only: :show
  end
  resources :users, only: :show
end
