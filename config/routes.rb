Rails.application.routes.draw do
  resources :songs
  resources :vinyls do
    resources :songs, only: [:index, :show]
  end
  resources :artists
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}
  root to: 'application#home'
end
