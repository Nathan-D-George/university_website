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
  get 'contact_us',   to: 'pages#contact_us'

  get    '/sign_in',  to: 'sessions#new'
  post   '/sign_in',  to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  get  '/sign_up',    to: 'registrations#new'
  post '/sign_up',    to: 'registrations#create'
  post '/edit_user', to: 'registrations#edit'
  get  '/apply',      to: 'registrations#apply'
  post '/apply',      to: 'registrations#process_application'

  get '/blackboard', to: 'blackboard#home'

  get    '/blackboard/new_subject',     to: 'subjects#new',     as: 'new_subject'
  post   '/blackboard/new_subject',     to: 'subjects#create',  as: 'create_subject'
  get    '/blackboard/edit_subject',    to: 'subjects#edit',    as: 'edit_subject'
  patch  '/blackboard/edit_subject',    to: 'subjects#update',  as: 'update_subject'
  get    '/blackboard/show_subject',    to: 'subjects#show',    as: 'show_subject'
  get    '/blackboard/list_subjects',   to: 'subjects#list',    as: 'list_subjects'
  delete '/blackboard/delete_subject',  to: 'subjects#destroy', as: 'delete_subject'
  get    '/blackboard/subject/content', to: 'subjects#content', as: 'subject_content'

  get    '/blackboard/lessons_list',   to: 'lessons#list',   as: 'list_lessons'
  get    '/blackboard/lessons_show',   to: 'lessons#show',   as: 'show_lesson'
  get    '/blackboard/lessons_new',    to: 'lessons#new',    as: 'new_lesson'
  post   '/blackboard/lessons_create', to: 'lessons#create', as: 'create_lesson'
  get    '/blackboard/lessons_edit',   to: 'lessons#edit',   as: 'edit_lesson'
  patch  '/blackboard/lessons_update', to: 'lessons#update', as: 'update_lesson'

  get '/blackboard/secret', to: 'lessons#secret'

end



# so will i