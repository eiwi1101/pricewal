SimpleGallery::Application.routes.draw do

    root 'static#home'

    # Session Management
    get    '/login'  => 'sessions#new', as: :session
    post   '/login'  => 'sessions#create'
    delete '/login'  => 'sessions#destroy'
    get    '/logout' => 'sessions#destroy', as: :logout

    # Users Management
    resources :users
    get    '/register' => 'users#new', as: :register

    # Admin Namespace
    namespace :admin do
      root 'dashboard#main'

      resources :pages
      resources :settings

      resources :galleries do
        resources :images
      end

      resources :users

      get '/todo' => 'static#todo', as: :todo
      get '/about' => 'static#about'
      get '*page' => 'static#notfound', as: :notfound
    end

    # Consume Resources
    resources :artworks, only: [ :index, :show ], constraints: { format: /(json|html)/ }

    # Static Routes
    get '/md' => 'static#markdown', as: :markdown

    # Catch Pages
    get '*page' => 'static#page', as: :page

end
