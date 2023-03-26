namespace :v1 do
  devise_scope :user do
    get "signup", to: "registrations#index"
    post "signup", to: "registrations#create"
    post "signin", to: "login#index"
  end
end
