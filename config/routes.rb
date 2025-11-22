# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      # Simple Authentication (no tokens)
      post 'auth', to: 'auth#register'
      post 'auth/sign_in', to: 'auth#login'
      delete 'auth/sign_out', to: 'auth#logout'

      get :status, to: 'health#status'
      resources :impersonations, only: %i[create], constraints: Impersonation::EnabledConstraint.new
      resources :settings, only: [] do
        get :must_update, on: :collection
      end

      # Soulingo API Endpoints
      resources :lessons do
        resources :media_resources, only: %i[index], path: 'media'
        resources :vocabulary_items, only: %i[index], path: 'vocabulary'
        resources :quizzes, only: %i[index]
      end

      resources :media_resources, only: %i[create], path: 'media' do
        post :upload, on: :collection
      end

      resources :vocabulary_items, only: %i[create], path: 'vocabulary'

      resources :quizzes, only: [] do
        post :submit, on: :member
      end

      resources :user_progresses, only: [], path: 'progress' do
        get :index, on: :collection, path: 'user/:user_id', as: :user
        post :update, on: :collection, path: 'update'
      end
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :admin do
    authenticate(:admin_user) do
      mount Flipper::UI.app(Flipper) => '/feature-flags'
      mount GoodJob::Engine => '/background-jobs'
    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
