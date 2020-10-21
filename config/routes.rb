Rails.application.routes.draw do

  scope module: 'interact' do
    scope ':commentable_type/:commentable_id' do
      resources :comments, only: [:index, :show, :create, :update, :destroy]
    end
    scope ':abusement_type/:abusement_id' do
      resources :abuses, only: [:create, :destroy]
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
        post :toggle, on: :collection
        delete '' => :destroy, on: :collection
      end
    end
  end

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

  scope :admin, module: 'interact/admin', as: :admin do
    resources :comments
    resources :attitudes
    resources :stars
    resources :abuses
  end

end
