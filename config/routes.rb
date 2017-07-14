Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/contacts" => "pages#index"
  get "/contacts/new" => "pages#new"
  post "/contacts" => "pages#create"
  get "/contacts/:id" => "pages#show"
  get "contacts/:id/edit" => "pages#edit"
  patch "/contacts/:id" => "pages#update"
  delete "/contacts/:id" => "pages#destroy"
end
