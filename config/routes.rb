SimpleGallery::Application.routes.draw do

    root 'static#home'

    # Static Routes
    get '/md' => 'static#markdown', as: :markdown

    # Catch Pages
    get '*page' => 'static#page', as: :page

end
