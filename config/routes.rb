Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => "homes#about"

    resource :customers, only:[:show, :edit, :update] do
      get "confirm" => "customers#confirm"
      patch "withdrawal" => "customers#withdrawal"
    end

    resources :address, only:[:index, :create, :destroy, :edit, :update]

    resources :items, only:[:index, :show]

    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete :destroy_all
      end
    end

    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        post :confirm
        get :complete
      end
    end
  end

  namespace :admin do
    get "/" => "homes#top"

    resources :customers, only:[:index, :show, :edit, :update]

    resources :items, only:[:new, :create, :index, :show, :edit, :update]

    resources :genres, only:[:index, :create, :edit, :update]

    resources :orders, only:[:show, :update]

    resources :order_details, only:[:update]
  end

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
