Rails.application.routes.draw do

  get 'questions/index'

  get 'questions/show'

  get 'questions/new'

  get 'questions/edit'
  
  resources :topics do
    resources :posts, except: [:index]
  end
  
  resources :advertisements
  resources :questions

  get 'about' => 'welcome#about'
  
  get 'welcome/contact'
  
  get 'welcome/faq'
  
  root 'welcome#index'
  
end
