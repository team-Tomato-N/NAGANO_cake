Rails.application.routes.draw do

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
  get 'members/my_page'=> 'public/members#show'
  get 'members/info/edit'=> 'public/members#edit'
  patch 'members/info'=> 'public/members#update'
  get 'members/confirm'=> 'public/members#confirm'
  patch 'members/withdraw'=> 'public/members#withdraw'


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
