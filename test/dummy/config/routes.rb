Rails.application.routes.draw do
  # include agegate routes
  use_agegate

  # mount Agegate::Engine => "/agegate"
  # root to: "agegate/gate#show"
  root to: "page#show"
end
