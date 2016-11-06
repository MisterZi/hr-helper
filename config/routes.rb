Rails.application.routes.draw do
  root 'vacancies#index'

  resources :vacancies
end
