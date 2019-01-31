Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #what does shallow: true do?
  resources :books, shallow: true do
    resources :reviews
  end
  resources :authors
end
