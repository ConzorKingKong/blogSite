Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'account_activations/edit'

  get 'sessions/new'

  root                'static_pages#home'
  get '.well-known/acme-challenge/Frrsoo5hT_XrjnmU8_-KtIepkaPD0ZLD1tDADJ-sgBk' => 'static_pages#letsencrypt'
  get    'faq'     =>  'static_pages#faq'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
