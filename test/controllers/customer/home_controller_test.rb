require 'test_helper'

class Customer::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_home_index_url
    assert_response :success
  end

end
