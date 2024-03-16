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
    get 'blog', to: 'news#index', active_tab: 'tab2', as: 'blog_index'
    resources :lbr, only: [] do
      collection do
        get :show
        get :about
        get :staff
      end
    end
    resources :news, only: [:index, :show] do
      member do
        get 'article'
      end
    end
    resources :shops, only: [:index]
    resources :company, only: [] do
      collection do
        get :show
      end
    end
    resources :contacts, only: [:new, :create] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :job_entries, only: [:new, :create] do
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
