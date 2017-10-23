Rails.application.routes.draw do

  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/edit'
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  resources :users, only: [:new, :create, :show]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :advertisements
  resources :questions

  get 'about' => 'welcome#about'
  
  get 'contact' => 'welcome#contact'
  
  get 'faq' => 'welcome#faq'
  
  root 'welcome#index'
  
end
