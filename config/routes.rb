Rails.application.routes.draw do
  get 'page/home'

  get 'page/about'

  get 'page/contact'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'page#home'

  resources :users do
    resources :bikes, :except => [:index]

  end
end
