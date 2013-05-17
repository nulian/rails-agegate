# require 'agegate/route_extensions'

module Agegate
  class Engine < ::Rails::Engine
    isolate_namespace Agegate

    # default test framework
    config.generators do |g|                                                               
      g.test_framework :rspec
      g.integration_tool :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    # default options, we can override it in the initializer
    config.agegate = ActiveSupport::OrderedOptions.new
    config.before_configuration do |app|
      app.config.agegate.min_age = 18
      app.config.agegate.skip = false
    end

    # DSL to include the routes
    initializer 'agegate.new_routes', :after => 'action_dispatch.prepare_dispatcher' do |app|
      ActionDispatch::Routing::Mapper.send(:include, Agegate::RouteExtensions)    
    end

    initializer "agegate.load_helpers" do |app|
      ActionController::Base.send :include, GatesCheck
    end    

  end
end
