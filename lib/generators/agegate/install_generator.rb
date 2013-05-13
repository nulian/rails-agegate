module Agegate
  class InstallGenerator < Rails::Generators::Base
    def install
      run 'bundle install'
      route "mount Agegate::Engine => '/agegate'"
      # add more here to move files around
    end
  end
end