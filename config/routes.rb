Rails.application.routes.draw do

  # 管理者側(sign_in, _outのみ)
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admin/sessions#new', as: 'new_admin_session'
    post 'admin/sign_in' => 'admin/sessions#create', as: 'admin_session'
    delete 'admin/sign_out' => 'admin/sessions#destroy', as: 'destroy_admin_session'
  end

  # ユーザー側(sign_up, _in, _out)
  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_in' => 'public/sessions#new', as: 'new_customer_session'
    post 'customers/sign_in' => 'public/sessions#create', as: 'customer_session'
    delete 'customers/sign_out' => 'public/sessions#destroy', as: 'destroy_customer_session'
    get 'customers/sign_up' => 'public/registrations#new', as: 'new_customer_registration'
    post 'customers' => 'public/registrations#create', as: 'customer_registration'
  end

  scope module: :public do
    root :to => 'homes#top'
    get '/about' => 'homes#about'

    # 投稿に関するルーティング
    resources :diys, only: [:new, :create, :index, :show, :update, :destroy] do
      resources :diy_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    # 会員情報に関するルーティング
    resources :customers, only: [:show, :edit, :update] do
      collection do
        # 退会を確認する画面の表示
        get 'hide' => 'customers#hide'
        # 退会処理を行うURLを設定
        post 'out'
        patch 'out'
      end
    end
  end

end
