Rails.application.routes.draw do

  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/edit'

  resources :advertisements
  
  resources :posts
  
  resources :questions

  get 'about' => 'welcome#about'
  
  get 'welcome/contact'
  
  get 'welcome/faq'
  
  root 'welcome#index'
  
end
