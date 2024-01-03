Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admins do
    root 'home#show'
    resources :news
    resources :shops do
      member do
        post :restore, to: 'shops#restore'
      end

      collection do
        get :discarded, to: 'shops#discarded'
      end
    end
    resources :articles
    resources :admin_users
    resources :contacts, only: [:index, :update, :show]
    resources :job_entries, only: [:index, :update, :show]
  end

  scope module: :public do
    root 'home#show'
    resources :news, only: [:index, :show]
    resources :articles, only: [:index, :show]
    resources :shops, only: [:index]
  end
end
