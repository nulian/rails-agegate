Rails.application.routes.draw do
  
  use_agegate
  
  # test pages
  get "other" => "page#show"
  root to: "page#show"
end
