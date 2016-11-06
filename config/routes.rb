Rails.application.routes.draw do
  root 'vacancies#index'

  resources :skills, only: [:index, :create, :destroy]

  resources :vacancies do
    resources :skills, only: [:create, :destroy]
  end
end
