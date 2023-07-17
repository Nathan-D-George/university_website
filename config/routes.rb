Rails.application.routes.draw do
  root to: 'pages#home'
  get 'courses',    to: 'pages#courses'
  get 'residences', to: 'pages#residences'

  get '/sign_in',     to: 'sessions#new'
  delete '/sign_out', to: 'sessions#delete'

  get '/sign_up',     to: 'registrations#new'
  post 'sign_up',     to: 'registrations#create'
  patch '/edit_user', to: 'registrations#edit'  

end
