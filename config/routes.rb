Rails3MongoidDevise::Application.routes.draw do
  # scope module: 'meta_prog' do
  #   get 'front/index', path: '/meta/front'
  # end

  scope '/meta', module: 'meta_prog' do
    get 'front', to: 'front#index'
    get 'block', to: 'front#block'
    get 'iclass', to: 'front#iclass'
    get 'isource', to: 'front#isource'
  end

  scope '/ipattern', module: 'design_pattern' do
    get '', to: 'front#index'
    get 'iobserver', to: 'front#iobserver'
    get 'icomposite', to: 'front#icomposite'
  end

  scope '/ieikon', module: 'eikon_dev' do
    get '', to: 'front#index'
    get 'getstart', to: 'front#getstart'
  end

  resources :articles

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'
  devise_for :users
  resources :users
end