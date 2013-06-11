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
        if cookies[:gate] == "0"
          redirect_to denied_url
        elsif @gate.gate_pass?
          cookies[:gate] = {
            :value => 1,
            :expires => 1.year.from_now
          }
          redirect_back_or_default main_app.root_url
        else
          cookies[:gate] = {
            :value => 0,
            :expires => 1.day.from_now
            }
          redirect_to denied_url
        end
      else
        render :action => 'show'
      end
    end

  end
end
