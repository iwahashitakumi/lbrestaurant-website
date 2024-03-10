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
    resources :lbr, only: [] do
      collection do
        get :show
        get :about
        get :company
        get :staff
      end
    end
    resources :news, only: [:index, :show] do
      member do
        get 'article'
      end
    end
    resources :shops, only: [:index]
    resources :contacts, only: [:new, :create] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :job_entries, only: [:create] do
      collection do
        get :show
        post :confirm
        get :complete
        get :recruitment_info
        get :faq
      end
    end
  end
end
