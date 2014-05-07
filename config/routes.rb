Rails.application.routes.draw do
  root to: "welcome#index"
  get "/dashboard", to: "dashboard#index", at: "dashboard_path"
end
