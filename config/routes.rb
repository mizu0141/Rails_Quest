Rails.application.routes.draw do
  scope :api do
    resources :articles, param: :slug, only: %i[create]
    resources :articles, param: :slug, only: %i[show]
    resources :articles, param: :slug, only: %i[update]
    resources :articles, param: :slug, only: %i[destroy]
  end
end
