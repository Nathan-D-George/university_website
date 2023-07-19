Rails.application.routes.draw do
  root to: 'pages#home'
  get '/about',       to: 'pages#about'
  get '/courses',     to: 'pages#courses'
  get '/residences',  to: 'pages#residences'
  get '/calendars',   to: 'pages#calendars'
  get '/alumni',      to: 'pages#alumni'
  get '/departments', to: 'pages#departments'
  get '/electronic',  to: 'pages#electronic'
  get '/mechatronic', to: 'pages#mechatronic'
  get '/mechanical',  to: 'pages#mechanical'
  get '/civil',       to: 'pages#civil'
  get '/careers',     to: 'pages#careers'
  get '/ap_score',    to: 'pages#ap_score'

  get    '/sign_in',  to: 'sessions#new'
  post   '/sign_in',  to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  get  '/sign_up',    to: 'registrations#new'
  post '/sign_up',    to: 'registrations#create'
  patch '/edit_user', to: 'registrations#edit'

  # get  '/apply',      to: 'qualifications#apply'
  # post '/apply',      to: 'qualifications#process_application'

  get  '/apply',      to: 'qualifications#apply'
  post '/apply',      to: 'qualifications#process_application'

end
