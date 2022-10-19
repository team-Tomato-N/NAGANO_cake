Rails.application.routes.draw do
  devise_for :admins
  devise_for :members

  namespace :public do
    get 'shopping_addresses', to: 'shopping_addresses#index'
    post 'shopping_addresses', to: 'shopping_addresses#create'
    delete 'shopping_addresses/:id', to: 'shopping_addresses#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
