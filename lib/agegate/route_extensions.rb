module Agegate
  module RouteExtensions
    def use_agegate
      mount Agegate::Engine => "/agegate"
      get "agegate" => "agegate/gates#show"
      get "denied" => "agegate/gates#denied", :as => "denied"
    end
  end
end