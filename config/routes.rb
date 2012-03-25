LarkspurArabians::Application.routes.draw do
  resources :contents
  resources :galleries
  resources :horses
  resources :images
  resources :results
  resources :thumbs
  resources :sessions

  get "/about_arabians" => "contents#about_arabians"
  get "/about_liveries" => "contents#about_liveries"

  get "/services" => "contents#services"

  get "/liveries" => "contents#liveries"

  get "/contact_arabians" => "contents#contact_arabians"
  get "/contact_liveries" => "contents#contact_liveries"

  get "/horse" => "horses#map"
  get "/horse/:type" => "horses#load_type"
  get "/horse/:type/:id" => "horses#load_horse"
  get "/horse/:type/:id/results" => "horses#results"
  get "/horse/:type/:id/pedigree" => "horses#pedigree"
  get "/get_pedigree/:id" => "horses#get_pedigree"
  get "/for_sale" => "horses#for_sale"

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
