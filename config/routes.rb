Rails.application.routes.draw do
  devise_for :admins
  devise_for :members

  #get以下がURLの最後の記述で、to:いかがフォルダ→コントローラ名→アクション名
  get 'shopping_addresses', to: 'public/shopping_addresses#index'
  post 'shopping_addresses', to: 'public/shopping_addresses#create'
  delete 'shopping_addresses/:id', to: 'public/shopping_addresses#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
