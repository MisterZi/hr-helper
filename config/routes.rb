Rails.application.routes.draw do
  root 'vacancies#index'

  resources :vacancies do
    resources :skills, only: [:create, :destroy]
  end
end
