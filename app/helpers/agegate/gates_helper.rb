module Agegate
  module GatesHelper

    def check_agegate
      if cookies[:gate].blank?
        redirect_to agegate_url
      else
        redirect_to denied_url if cookies[:gate] == "0"
      end
    end
  end
end
