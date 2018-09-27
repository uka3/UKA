Rails.application.routes.draw do

  devise_scope :user do
    get 'tutorials/new' => 'tutorials#new'
  end

  mount ActionCable.server => '/cable'

  get 'users/index'

  get 'users/show'

  get 'posts/index',as: "posts_index"

  get 'posts/new',as: "posts_new"

  post "posts/create",as: "posts_create"

  get 'posts/:id' => "posts#show",as: "posts_show"

  get 'posts/:id/edit' => "posts#edit",as: "posts_edit"

  patch "posts/:id/update" => "posts#update",as: "posts_update"

  get 'tutorials/new'

  match 'tutorials/edit', via: [:get,:post,:patch]

  get 'pages/index'

  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

 def devise_scope(scope)

   constraint = lambda do |request|
     request.env["devise.mapping"] = Devise.mapping[scope]
     true
   end

   constraints(constraint) do
     yeild
   end

 end

  resources :users, only: [:index, :show] do
   resources :posts
 end

 resources :posts, only: [:index, :show]

 resources :posts, only: [:index, :show] do
    resources :evils, only: [:create, :destroy]
  end


end
