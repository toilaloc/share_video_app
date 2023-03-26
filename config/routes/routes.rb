devise_scope :user do
  get "/", to: "users#index"
  post "signin_or_signup", to: "users#create"
  delete "logout", to: "users#destroy"
end

get "share_videos", to: "share_videos#index"
post "share_videos", to: "share_videos#create"
