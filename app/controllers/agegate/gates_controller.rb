require_dependency "agegate/application_controller"

module Agegate
  class GatesController < ApplicationController

    def show
      @gate = Gate.new
    end

    def create
      @gate = Gate.new(params[:gate])
      if @gate.valid?

        if @gate.gate_pass?
          cookies[:gate] = 1
          redirect_to params[:referrer]
        else
          cookies[:gate] = 0
          redirect_to denied_url
        end

      else
        flash[:error] = "test"
        render :action => 'show'
      end
    end

  end
end
