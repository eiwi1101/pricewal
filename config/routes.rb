SimpleGallery::Application.routes.draw do

    root 'static#home'

    # Static Routes
    get '/md' => 'static#markdown', as: :markdown

end
