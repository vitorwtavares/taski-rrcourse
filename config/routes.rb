Rails.application.routes.draw do

  devise_for :users
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'error', to: 'pages#error'

  get 'google', to: redirect('https://google.com')

  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end

  root 'pages#home'

  get '*path', to: redirect('/error')
end
