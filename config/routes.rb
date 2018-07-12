Rails.application.routes.draw do
  get 'tutorials/new'
  match 'tutorials/edit', via: [:get,:post,:patch]
  get 'pages/index'
  root to: 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
