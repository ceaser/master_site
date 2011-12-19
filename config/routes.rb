require 'domain'

MasterSite::Application.routes.draw do
  resources :products

  constraints(Domain) do
    root :to => "products#index"
  end

  root :to => 'home#index'
end
