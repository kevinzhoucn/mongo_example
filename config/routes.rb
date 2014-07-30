Rails3MongoidDevise::Application.routes.draw do
  # scope module: 'meta_prog' do
  #   get 'front/index', path: '/meta/front'
  # end

  scope '/meta', module: 'meta_prog' do
    get 'front', to: 'front#index'
    get 'block', to: 'front#block'
  end

  resources :articles

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
  devise_for :users
  resources :users
end