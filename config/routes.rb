LarkspurArabians::Application.routes.draw do
  resources :contents
  resources :galleries
  resources :horses
  resources :images
  resources :results
  resources :sessions
  resources :thumbs
  resources :users

  get "/about_arabians" => "contents#about_arabians"
  get "/about_liveries" => "contents#about_liveries"

  get "/services" => "contents#services"

  get "/liveries" => "contents#liveries"

  get "/contact_arabians" => "contents#contact_arabians"
  get "/contact_liveries" => "contents#contact_liveries"

  get "/horses" => "horses#map"
  get "/horses/:type" => "horses#load_type"
  get "/horses/:type/:id" => "horses#load_horse"
  get "/horses/:type/:id/pedigree" => "horses#pedigree"
  get "/get_pedigree/:id" => "horses#get_pedigree"
  get "/horses/:type/:id/results" => "horses#results"
  get "/horses/for_sale" => "horses#for_sale"

  get "/galleries_arabians" => "galleries#arabians"
  get "/galleries_liveries" => "galleries#liveries"
  get "/galleries/:id" => "galleries#load_gallery"

  # debug
  get "/pedigree/:id" => "horses#pedigree"
  # end

  get "login" => "sessions#index"
  get "logout" => "sessions#destroy"
  get "admin" => "admin#index"

  root :to => "home#index"
end
