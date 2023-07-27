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
  post '/edit_user',  to: 'registrations#edit'
  get  '/apply',      to: 'registrations#apply'
  post '/apply',      to: 'registrations#process_application'

  get  '/blackboard',            to: 'blackboard#home'
  get  '/blackboard/secret',     to: 'lessons#secret'
  get  '/blackboard/admin_page', to: 'enlistments#add_lecturer', as: 'admin_page'
  post '/blackboard/admin_page', to: 'enlistments#actually_add_lecturer'

  resources :subjects, except: [:destroy, :new, :edit]
  get    '/blackboard/subject_new',     to: 'subjects#new',     as: 'new_subject'
  post   '/blackboard/subject_new',     to: 'subjects#create',  as: 'create_subject'
  get    '/blackboard/subject_edit',    to: 'subjects#edit',    as: 'edit_subject'
  patch  '/blackboard/subject_edit',    to: 'subjects#update',  as: 'update_subject'
  get    '/blackboard/subject_show',    to: 'subjects#show',    as: 'show_subject'
  get    '/blackboard/subjects_list',   to: 'subjects#list',    as: 'list_subjects'
  delete '/blackboard/subject_delete',  to: 'subjects#destroy', as: 'delete_subject'
  get    '/blackboard/subject_content', to: 'subjects#content', as: 'subject_content'

  resources :lessons, except: [:destroy, :new, :edit]
  get    '/blackboard/lessons_list',   to: 'lessons#list',   as: 'list_lessons'
  get    '/blackboard/lessons_show',   to: 'lessons#show',   as: 'show_lesson'
  get    '/blackboard/lessons_new',    to: 'lessons#new',    as: 'new_lesson'
  post   '/blackboard/lessons_create', to: 'lessons#create', as: 'create_lesson'
  get    '/blackboard/lessons_edit',   to: 'lessons#edit',   as: 'edit_lesson'
  patch  '/blackboard/lessons_update', to: 'lessons#update', as: 'update_lesson'

  

  get    '/blackboard/assessment_new',    to: 'assessments#new',    as: 'new_assessment'
  post   '/blackboard/assessment_new',    to: 'assessments#create', as: 'create_assessment'
  get    '/blackboard/assessment_edit',   to: 'assessments#edit',   as: 'edit_assessment'
  patch  '/blackboard/assessment_update', to: 'assessments#update', as: 'update_assessment'
  delete '/blackboard/assessment_delete', to: 'assessments#delete', as: 'delete_assessment'

  get    '/blackboard/enlistment_new',    to: 'enlistments#new',     as: 'new_enlistment'
  post   '/blackboard/enlistment_new',    to: 'enlistments#create',  as: 'create_enlistment'
  get    '/blackboard/enlistment_edit',   to: 'enlistments#edit',    as: 'edit_enlistment'
  delete '/blackboard/enlistment_delete', to: 'enlistments#destroy', as: 'destroy_enlistment'
  

end

=begin

  to do:
    tick:: enable people to register for subjects they may have failed
    enable a selection process instead of automatic acceptance (should be manual IRL but anyway)
    tick:: table to see only people who are registered for a subject marks
    
    finalize admin rights
    admin must assign lecturers to subjects

  pre-prayer:
    i surrender (extended version)
    Yahweh will manifest

  Worship:
    Praise (Elevation)
    I speak Jesus (Charity Gayle)
    Holy Forever (Bethel)

=end