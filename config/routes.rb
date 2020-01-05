Rails.application.routes.draw do
  devise_for :managers, controllers: { omniauth_callbacks: 'managers/omniauth_callbacks' }
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete "users/sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end
  devise_scope :manager do
    delete "managers/sign_out", to: "devise/sessions#destroy", as: :destroy_manager_session
  end

  root to: "landing#index"
end
