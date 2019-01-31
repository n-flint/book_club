Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, shallow: true do
    resources :reviews
  end
  resources :authors
  # resources :reviews
end
