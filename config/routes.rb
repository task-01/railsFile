Rails.application.routes.draw do
  # get 'rooms/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do#トップページをログイン画面に
    root "users/sessions#new"
  end
end
