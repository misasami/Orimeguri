Rails.application.routes.draw do
  devise_for :users

  resources :kimonos do
    resources :bookmarks, only: [:create, :destroy]
  end

  # ブックマークに関するルーティング
  post '/kimonos/:id/bookmarks', to: 'bookmarks#create', as: 'kimonos_bookmarks'
  delete '/kimonos/:id/bookmarks/:bookmark_id', to: 'bookmarks#destroy', as: 'kimonos_bookmark'

  # 新規投稿に関するルーティング
  post '/kimonos', to: 'kimonos#create', as: 'create_kimono'
  
  root 'kimonos#index'
end

