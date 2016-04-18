Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :conversations, only: [:show]
  
  get 'chat', to: 'conversations#retrieve_conversation', as: 'chat'
  
  post 'reminder', to: 'emails#reminder', as: 'reminder'
  
  post 'update_rating', to: 'saved_links#update_rating', as: 'update_rating'
  
  resources :saved_links, only: [:index]

  get 'update_link', to: 'saved_links#update_link', as: 'update_link'
  
  get 'posts/test'

  get 'posts/test_yaml'

  resources :appointments

  get "my_clients", to: 'appointments#my_clients', as: 'my_clients'
  get 'my_appointments', to: 'appointments#my_appointments', as: 'my_appointments'

  get 'search', to: 'search#results', as: 'search'

  get 'contact/new'

  post 'contact/send_email'

  #IP message token
  post 'tokens' => "tokens#create"

  get 'my_answers', to: 'answers#my_answers', as: 'my_answers'

  resources :messages

  resources :answers

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users

  resources :posts

  get 'my_posts', to: 'posts#my_posts', as: 'my_posts'

 get 'auth/:provider/callback', to: 'sessions#create'

 get 'sign_out', to: 'sessions#destroy', as: 'sign_out'

 post 'send', to: 'messages#email_message', as: 'mail'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
