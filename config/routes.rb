Rails.application.routes.draw do
  #Projects controller
  get '/' => 'projects#index'
  get '/projects' => 'projects#index'

  get '/projects/new'=> 'projects#new'
  post '/projects' => 'projects#create'

  get '/projects/:id' => 'projects#show'

  get '/projects/:id/edit' => 'projects#edit'
  patch '/projects/:id' => 'projects#update'

  delete '/projects/:id' => 'projects#destroy'

  #tasks controller
  get '/tasks' => 'tasks#index'

  get '/tasks/new'=> 'tasks#new'
  post '/tasks' => 'tasks#create'

  get '/tasks/:id' => 'tasks#show'

  get '/tasks/:id/edit' => 'tasks#edit'
  patch '/tasks/:id' => 'tasks#update'

  delete '/tasks/:id' => 'tasks#destroy'
end
