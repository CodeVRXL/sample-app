Rails.application.routes.draw do
  get 'static_pages/home' # maps requests for the URL /static_pages/home to the home action in the Static Pages controller.
  get 'static_pages/help'
  get 'static_pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'static_pages#home' #leads to the creation of Rails helper called 'root_url' (in analogy with helpers like 'static_pages_home_url')
end
