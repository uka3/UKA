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
  root to: 'pages#index'
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
  resources :users, :only => [:show]
  #resources :users, :only => [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #if Rails.env.development?
    #mount LetterOpenerWeb::Engine, at: "/letter_opener"
  #end

end
