module Agegate
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)

    def install
      # run 'bundle install'
      route "use_agegate"

      # copy views
      copy_file "views/show.html.erb", "app/views/agegate/gates/show.html.erb"
      copy_file "views/denied.html.erb", "app/views/agegate/gates/denied.html.erb"
      copy_file "views/_form.html.erb", "app/views/agegate/gates/_form.html.erb"
      copy_file "views/application.html.erb", "app/views/layouts/agegate/gates/application.html.erb"

      # copy assets
      copy_file "assets/application.css", "app/assets/stylesheets/agegate/application.css"
      copy_file "assets/gate.css", "app/assets/stylesheets/agegate/gate.css"
    end
  end
end