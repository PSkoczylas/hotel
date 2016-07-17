Rails.application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_up => "register" }
  #devise_for :user
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
