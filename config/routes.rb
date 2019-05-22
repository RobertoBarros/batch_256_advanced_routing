Rails.application.routes.draw do

  namespace :admin do
    resources :restaurants, only: :index
  end

  resources :reviews, only: [:show, :edit, :update, :destroy]

  resources :restaurants do
    resources :reviews, only: %i[new create index]


    member do
      get 'chef'
    end
    # get 'chef', on: :member

    collection do
      get 'top'
    end
    # get 'top', on: :collection
  end



  root to: 'restaurants#index'
end
