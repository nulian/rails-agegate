module Agegate
  module RouteExtensions
    def use_agegate
      mount Agegate::Engine => "/agegate"
      get "gate" => "agegate/gate#index"
    end
  end
end