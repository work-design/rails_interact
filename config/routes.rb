Rails.application.routes.draw do

  scope :my, module: 'interact/my', as: :my do
    scope ':commentable_type/:commentable_id' do
      resources :comments
    end
    scope ':attitudinal_type/:attitudinal_id' do
      resources :attitudes do
        post :like, on: :collection
        post :dislike, on: :collection
      end
    end
  end

  scope :api, module: 'interact/api', as: :api do
    scope ':commentable_type/:commentable_id' do
      resources :comments, only: [:index, :show, :create, :update, :destroy]
    end
    scope ':attitudinal_type/:attitudinal_id' do
      resources :attitudes, only: [:index, :show, :create, :update, :destroy] do
        post :like, on: :collection
        post :dislike, on: :collection
        post :cancel, on: :collection
      end
    end
    resources :stars, only: [:index]
    scope ':starred_type/:starred_id' do
      resources :stars, only: [:create] do
        delete '' => :destroy, on: :collection
      end
    end
  end

  scope :admin, module: 'interact/admin', as: 'admin' do
    resources :comments
    resources :attitudes
    resources :stars
  end

end
