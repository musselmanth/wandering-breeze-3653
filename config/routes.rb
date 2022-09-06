Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/projects/:id', to: 'projects#show'
  get '/contestants', to: 'contestants#index'
  get '/projects/:project_id/contestants/new', to: 'contestant_projects#new'

  post '/projects/:project_id/contestants', to: 'contestant_projects#create'

end
