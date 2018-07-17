Rails.application.routes.draw do

  # get 'static_pages/home' # maps requests for the URL /static_pages/home to the home action in the Static Pages controller

  # Rails convention: named routes. Makes things more intuitive and easier for users to navigate webpage!

  # get 'static_pages/help'
  get '/help',      to: 'static_pages#help' #creates 'help_path' and 'help_url', same as root #if add ", as: 'helf'" -> creates named
                                                                                          # routes 'helf_path' and 'helf_url' instead!
  # get 'static_pages/about'
  get '/about',     to: 'static_pages#about'
  # get 'static_pages/contact'
  get '/contact',   to: 'static_pages#contact'
  get 'users/new'
  get '/signup',    to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'static_pages#home' #leads to the creation of Rails helper called 'root_url' and 'root_path' (in analogy with helpers like 'static_pages_home_url')
                                  # root_path -> '/'
                                  # root_url -> 'https://example.com/' either will work
                                  # Convention: use _path, only use _url for redirects!
end
