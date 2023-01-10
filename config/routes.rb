Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'users/home'
  get 'users/show'
  get 'rooms/index'
  get 'rooms/show'
  get 'users/register'
  get 'registers/show'
  get 'registers/index'
  get 'rooms/register'
  post 'registers/back' 
  post 'registers/confirmation', to: 'registers#confirmation', as: 'confirmation'
  # post 'registers/complete', to: 'registers#complete', as: 'complete'
  resources :rooms
  resources :users do
    collection do
      get 'search'
    end
  end
  resources :registers
  devise_scope :user do#トップページをログイン画面に
    root 'users#home'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
