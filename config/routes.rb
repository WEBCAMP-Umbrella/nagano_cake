Rails.application.routes.draw do
  root 'customer/home#index'

  namespace :admin do
    resources :orders, only: [:show, :index, :update]
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_items, only: [:update]
    root 'home#index'
  end

  scope module: :customer do
    resource :customer , only: [:show] do
      member do
        patch '/' => 'customers#destroy', as: 'destroy'
        get 'cancel'
      end
      resources :shipping_addresses, only: [:index, :create, :update, :destroy, :edit]
      resources :orders, only: [:index, :create, :new, :show] do
        collection do
          post 'confirm'
          get 'thanks'
        end
      end
      resources :cart_items, only: [:create, :update, :destroy, :index, :cart_destroy]
      delete 'cart_items/' => 'cart_items#cart_destroy'
      resources :items, only: [:index, :show] do
        collection do
          get 'search'
        end
        resources :likes,only: [:create, :destroy]
      end
    end
  end

  devise_for :admins, controllers: {
    sessions:      'admin/admins/sessions',
    passwords:     'admin/admins/passwords',
    registrations: 'admin/admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customer/customers/sessions',
    passwords:     'customer/customers/passwords',
    registrations: 'customer/customers/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
