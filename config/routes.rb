Books::Application.routes.draw do
  root 'books#index'

  resources :books do
    collection do
      get 'page/:page', :action => :index
      get 'bargains'
      get 'bargains/page/:page', :action => :bargains
    end

    resources :reviews
    resources :messages
  end


  resources :photos
  devise_for :users
  get 'users',          to: 'users#index',   as: :all_users
  get 'users/:id',      to: 'users#show',    as: :single_user
  get 'users/:id/edit', to: 'users#edit',    as: :edit_user
end
