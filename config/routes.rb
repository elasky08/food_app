Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/about" => "home#about", as: :about
  get "/contact" => "contact#new", as: :new_contact
  post "/contact" => "contact#create", as: :contact

  resource :cart, only: [:show, :create, :update, :edit, :destroy] do
    patch :add
    put :add
  end

  # resource :cart, only: [:index, :create, :show]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, shallow: true do
    resources :menu_items
    resources :reviews
    resources :menu_items do
      resources :payments, only: [:new, :create]
      resources :tags
    end
    resources :votes
  end
  resources :users, only:[] do
  resources :reviews, only: [] do
    resources :likes, only: [:create, :destroy]
end
  end

  resources :orders

  root "home#index"
end
