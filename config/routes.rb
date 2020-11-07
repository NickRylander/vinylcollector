Rails.application.routes.draw do
  resources :songs
  resources :vinyls do
    resources :songs, only: [:index, :new, :show]
  end
  resources :artists do
    resources :vinyls, only: [:index, :new, :show]
  end
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}
  root to: 'application#home'
end
