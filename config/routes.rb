SimpleGallery::Application.routes.draw do

    root 'static#home'

    # Admin Namespace
    namespace :admin do
      root 'static#home'
    end

    # Static Routes
    get '/md' => 'static#markdown', as: :markdown

    # Catch Pages
    get '*page' => 'static#page', as: :page

end
