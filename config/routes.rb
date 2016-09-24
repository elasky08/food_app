Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/about" => "home#about", as: :about
  get "/contact" => "contact#new", as: :new_contact
  post "/contact" => "contact#create", as: :contact

  resources :users do
    resources :orders
    resources :votes
    resources :reviews do
      resources :likes
    end
    resources :menu_items do
      resources :tags
    end
  end

  resources :sessions do
    delete :destroy, on: :collection
  end

  root "home#index"
end
