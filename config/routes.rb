Rails.application.routes.draw do
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'contact', to: 'welcome#contact'

  resources :works

  namespace :admin do
    root to: "works#index"
    resources :works
  end
end
