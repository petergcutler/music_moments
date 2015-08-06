Rails.application.routes.draw do
  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
    resources :comments
    end
  get 'tags/:tag', to: 'posts#tagged', as: :tag
  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out!'
end
