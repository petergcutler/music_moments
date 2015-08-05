Rails.application.routes.draw do
  resources :posts do
    resources :comments
    end
    root to: 'posts#index'
    get 'tags/:tag', to: 'posts#tagged', as: :tag
  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out!'
end
