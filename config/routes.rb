Rails.application.routes.draw do

	devise_for :users

     devise_scope :user do
	  get 'sign_in', to: 'devise/sessions#new'
	end
  # devise_for :users
	namespace :v1 do
		resources :contacts
		resources :sessions, only: [:create, :destroy, :index]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
