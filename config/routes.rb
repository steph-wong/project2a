Rails.application.routes.draw do

  root 'static_pages#home'

  get '/home',      to: 'static_pages#home'
  get '/about',     to: 'static_pages#about'
  get '/contact',   to: 'static_pages#contact'
  get '/register',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users,      except: [:new]
  resources :products
  resources :reviews

  resources :products do
    resources :reviews
  end

end
