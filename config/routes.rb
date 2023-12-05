Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }

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
  end
end
