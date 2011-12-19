require 'domain'

MasterSite::Application.routes.draw do
  resources :customers

  resources :products

  constraints(Domain) do
    root :to => "products#index"
  end

  root :to => 'customers#index'
end
