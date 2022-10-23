Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: "public/homes#top"
  get 'about'=> 'public/homes#about'
  get 'admin'=> 'admin/homes#top'


  scope module: :public do
  resources :shopping_addresses

  end

  #get以下がURLの最後の記述で、to:いかがフォルダ→コントローラ名→アクション名
  #get 'shopping_addresses', to: 'public/shopping_addresses#index'
  #post 'shopping_addresses', to: 'public/shopping_addresses#create'
  #delete 'shopping_addresses/:id', to: 'public/shopping_addresses#destroy', as:"shopping_address"
  #get 'shopping_addresses/:id/edit', to: 'public/shopping_addresses#edit', as:"edit_shopping_address"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
