class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_agegate

end
