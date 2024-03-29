Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  get "/orders/complete" => "public/orders#complete"
  root to: "public/homes#top"
  get 'about'=> 'public/homes#about'
  get 'admin'=> 'admin/homes#top'

  # get "admin/items" => "admin/items#index", as: "admin_items"
  # get "admin/items/new" => "admin/items#new", as: "admin_new_items"
  # post "admin/items" => "admin/items#create", as: "admin_create_items"
  # get "admin/items/:id" => "admin/items#show", as: "admin_item"
  # get "admin/items/:id/edit" => "admin/items#edit", as: "admin_edit_item"
  # patch "admin/items/:id" => "admin/items#update", as: "admin_update_item"


  get 'members/my_page'=> 'public/members#show'
  get 'members/info/edit'=> 'public/members#edit'
  patch 'members/info'=> 'public/members#update'
  get 'members/confirm'=> 'public/members#confirm'
  patch 'members/withdraw'=> 'public/members#withdraw'
  get 'members' => 'public/members#dummy'
  post "/orders/confirm" => "public/orders#confirm"

  scope module: :public do
    resources :shopping_addresses

    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :create,:update, :destroy]
    delete "/cart_item/destroy_all" => "cart_items#destroy_all"
    resources :orders, only: [:new, :create, :show, :index]

  end

  namespace :admin do
    resources :members, only: [:update, :edit, :show, :index]
    resources :items
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :genres, only: [:index, :edit, :create, :update]
  end


  #get以下がURLの最後の記述で、to:いかがフォルダ→コントローラ名→アクション名
  #get 'shopping_addresses', to: 'public/shopping_addresses#index'
  #post 'shopping_addresses', to: 'public/shopping_addresses#create'
  #delete 'shopping_addresses/:id', to: 'public/shopping_addresses#destroy', as:"shopping_address"
  #get 'shopping_addresses/:id/edit', to: 'public/shopping_addresses#edit', as:"edit_shopping_address"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end