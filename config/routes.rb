Agegate::Engine.routes.draw do
  resource "gates"
  get "denied" => "gates#denied", :as => "denied"
end
