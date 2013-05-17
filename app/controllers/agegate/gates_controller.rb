require_dependency "agegate/application_controller"

module Agegate
  class GatesController < ApplicationController
    layout 'agegate/gates/application'

    def show
      unless cookies[:gate].blank?
        redirect_to main_app.root_url
      end
      @gate = Gate.new
    end

    def denied
      if cookies[:gate].blank? || cookies[:gate] == "1"
        redirect_to main_app.root_url
      end
    end

    def create
      @gate = Gate.new(params[:gate])
      if @gate.valid?

        if @gate.gate_pass?
          cookies[:gate] = 1
          # redirect_to params[:referrer]
          redirect_back_or_default main_app.root_url
        else
          cookies[:gate] = 0
          redirect_to denied_url
        end
      else
        render :action => 'show'
      end
    end

  end
end
