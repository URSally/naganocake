Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
     resources :orders, only: [:show]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: :about

    get 'customers/mypage' => 'customers#show', as: :public_customer
    get 'customers/mypage/edit' => 'customers#edit', as: :edit_public_customer
    get 'customers/check' => 'customers#check', as: :check_public_customer
    patch 'customers/mypage' => 'customers#update', as: :customer
    patch 'customers/withdraw' => 'customers#withdraw', as: :withdraw_public_customer


    resources :items, only: [:index, :show]
    post 'orders/confirm' => 'orders#confirm', as: :orders_confirm
    get 'orders/complete' => 'orders#complete', as: :orders_complete
    resources :orders, only: [:new, :index, :create, :index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: :destroy_all_cart_items
    resources :cart_items, only: [:index, :create, :update, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
