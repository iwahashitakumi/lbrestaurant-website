Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }
  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admins do
    root 'home#show'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
