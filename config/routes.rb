Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :members

  scope module: :public do
  resources :shopping_addresses
  resources :orders, only: [:new, :create, :show, :index]
  post "/orders/confirm" => "orders#confirm"
  get "/orders/complete" => "orders#complete"
  end

  #get以下がURLの最後の記述で、to:いかがフォルダ→コントローラ名→アクション名
  #get 'shopping_addresses', to: 'public/shopping_addresses#index'
  #post 'shopping_addresses', to: 'public/shopping_addresses#create'
  #delete 'shopping_addresses/:id', to: 'public/shopping_addresses#destroy', as:"shopping_address"
  #get 'shopping_addresses/:id/edit', to: 'public/shopping_addresses#edit', as:"edit_shopping_address"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
