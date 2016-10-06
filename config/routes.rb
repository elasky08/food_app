Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/about" => "home#about", as: :about
  get "/contact" => "contact#new", as: :new_contact
  post "/contact" => "contact#create", as: :contact

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create, :index, :show] do
    resources :menu_items do
      resources :tags
    end
    resources :orders
    resources :votes
    resources :reviews do
      resources :likes
    end
  end

  resources :menu_items, only: [:show] do
    resources :tags
  end
  root "home#index"
end
