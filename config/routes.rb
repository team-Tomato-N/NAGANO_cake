Rails.application.routes.draw do
  namespace :public do
    get 'shopping_addresses/index'
    get 'shopping_addresses/edit'
  end
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
