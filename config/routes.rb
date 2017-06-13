Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/employees", to: 'employees#index'
  get "/employees/new", to: 'employees#new'
  get "/employees/:id", to: 'employees#show'
  post "/employees", to: 'employees#create'
  get "/employees/:id/edit", to: 'employees#edit'
  patch "/employees/:id", to: 'employees#update'
  delete "/employees/:id", to: 'employees#destroy'
end
