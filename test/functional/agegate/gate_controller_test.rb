require 'test_helper'

module Agegate
  class GateControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
    test "should get denied" do
      get :denied
      assert_response :success
    end
  
  end
end
