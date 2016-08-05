Rails.application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "login" }, :skip => :registrations
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :rooms
  resources :clients
  resources :terms
end
