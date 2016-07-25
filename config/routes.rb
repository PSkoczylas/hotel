Rails.application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_up => "register" }
  #devise_for :user
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :rooms
end
