Rails.application.routes.draw do
  get 'page/home'

  get 'page/about'

  get 'page/contact'

  devise_for :users, :controllers => { :registrations => :registrations }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'page#home'

  resources :bikes do
    resources :reviews
  end

  resources :users do
    resources :bikes, :except => [:index]
    resources :places

  end

end
