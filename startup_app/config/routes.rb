Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles

  get 'investors/signup', to: 'investors#new'
  resources :investors, except: [:new]

  get 'mentors/signup', to: 'mentors#new'
  resources :mentors, except: [:new]

  get 'startups/signup', to: 'startups#new'
  resources :startups, except: [:new]

  get 'members/signup', to: 'members#new'
  resources :members, except: [:new]

  get 'signup', to: 'users#new'
  resources :users, except: [:new]


  get 'login', to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'

  get 'connect', to: 'rooms#index', as: 'connect'
  get 'rooms', to: 'rooms#index', as: 'rooms'
  resources :rooms, except: [:index, :new, :create]
  resources :messages
  get 'talk/:id', to: 'rooms#talk', as: 'talk'
  resources :categories
  mount ActionCable.server, at: '/cable'
end
