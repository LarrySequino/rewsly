Rewsly::Application.routes.draw do

  get '/search' => 'stories#search'
  get '/upvote/:id' => 'stories#upvote'

  resources :stories

  root 'stories#index'
end
